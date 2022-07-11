import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCubit extends Cubit<AppStates> {
  ApiCubit(AppStates initialState) : super(InitialAppState());
  static ApiCubit get(context) => BlocProvider.of(context);
  bool remeberMeValue = false;
  List shownDctors = [];
  List? initDctors;
  int count = 0;
  String? accessToken;
  String? refreshToken;
  Map? doctor;
  Map? nurse;
  Map? currentUser = {};
  List<Map> nurses = [];
  String? errorMsg;
  DateTime initialDate = DateTime.now();
  static String? urlImage;
  Location location = Location();
  static LatLng? initialPosition;
  List initSlots = [];
  List shownSlots = [];
  List? myAppointments;
  List shownAppointments = [];
  bool availbeDate = false;
  bool nursingListContinue = false;
  static List<Map<String, dynamic>> nursingTsks = [
    {
      "title": 'Injection / Home IV therapy',
      "description":
          'Intravenous injection (IV). The nurse injects a drug or solution directly into the blod via the vein.',
      "value": false,
    },
    {
      "title": 'Muscle Injection',
      "description":
          'Intramuscular injection (IM), the nurse injects a drug directly into the muscle.',
      "value": false,
    },
    {
      "title": 'Tracheostomy care',
      "description": 'The nurse provides tracheostomy care and mangement.',
      "value": false,
    },
    {
      "title": 'Urinary Catheter Insertion & Removal',
      "description":
          'The nurse performs one/all of the following procedures : intubation, replacment or removal of the urinary catheter.',
      "value": false,
    },
    {
      "title": 'Performing diagnostic tests',
      "description":
          'Nurses may perform a wide variety of diagnostic tests, including checking vitals and collecting tissue, blood.',
      "value": false,
    },
  ];

  void backToNormalState() {
    emit(InitialAppState());
  }

  void remeberMe(bool value) {
    remeberMeValue = value;
    emit(ChangeRemeberMeValue());
  }

  Future getDoctor() async {
    if (count == 0) {
      count++;
      emit(LoadingState());
      final pref = await SharedPreferences.getInstance();
      accessToken = pref.getString("access");
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      if (checkValidAccess(payload['exp'])) {
        try {
          var dio = Dio();

          var response =
              await dio.get("https://dawiny.herokuapp.com/api/doctors",
                  options: Options(headers: {
                    "authorization": accessToken,
                  }));
          initDctors = response.data;
          emit(DoneState());
        } on DioError catch (e) {
          print(e);

          errorMsg = e.response!.data['msg'];
          emit(ErrorState());
        }
      } else {
        var result = await refreshAccessToken();
        if (result == -1) {
          //make user login again
        } else {
          await pref.setString("access", result.toString());
          count = 0;
          getDoctor();
        }
      }
    }
  }

  void changeNurseValue(bool value, int index) {
    nursingTsks[index].update("value", (value1) => value);
    nursingTsks.elementAt(index);
    emit(ChangeNurseCheckBoxValue());
  }

  void changeNurseListBouttonValue() {
    var x = nursingTsks.indexWhere((element) => element['value'] == true);

    if (x != -1) {
      nursingListContinue = true;
    } else {
      nursingListContinue = false;
    }
    emit(ChangeNurseListButtonValue());
  }

  DateTime timeOfDayMinToInt(TimeOfDay t) {
    return DateTime(2022, 1, 1, t.hour, t.minute);
  }

  List avalibaleDates({required Map dates, required Duration interval}) {
    List available = [];
    dates.forEach((key, value) {
      var format = DateFormat.jm();
      var st = timeOfDayMinToInt(
          TimeOfDay.fromDateTime(format.parse(value['from'])));
      var end =
          timeOfDayMinToInt(TimeOfDay.fromDateTime(format.parse(value['to'])));

      while (st.isBefore(end)) {
        var currentEnd = st.add(interval);
        available.add({
          "day": key,
          "start": format.format(st),
          "end": format.format(currentEnd),
        });
        st = currentEnd;
      }
    });
    return available;
  }

  List searchAboutDoctor(String dignoseName, String value, bool? video) {
    if (initDctors == null) {
      return [];
    }
    shownDctors = initDctors!
        .where(
          (element) => (element['specification'] == dignoseName &&
              ("${element['firstName'].toLowerCase()} ${element['lastName'].toLowerCase()}"
                  .contains(value))),
        )
        .toList();

    emit(DoctrosSearch());
    return shownDctors;
  }

  Future<int> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
    String role,
  ) async {
    emit(LoadingState());

    var dio = Dio();
    String? url;

    final pref = await SharedPreferences.getInstance();
    try {
      var response = await dio.post(
        "https://dawiny.herokuapp.com/api/" + role + "s",
        data: jsonEncode({
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
          "role": role
        }),
      );

      print(response.data);

      if (response.statusCode == 201) {
        print("Done");
        accessToken = response.data['access'];
        refreshToken = response.data['refresh'];

        await pref.setString('access', accessToken!);
        await pref.setString('refresh', refreshToken!);
        await pref.setString('role', role);
        if (role == "doctor") {
          emit(DoneState());
          return -1;
        } else if (role == "nurse") {
          await updatePProfile(data: {"status": "online"});
        }
        emit(DoneState());
      }
      return 1;
    } on DioError catch (ex) {
      errorMsg = null;
      if (ex.response == null || ex.response!.data is! Map) {
        errorMsg = "something went wrong, please try again later";
      } else {
        errorMsg = ex.response!.data['msg'];
      }
      emit(ErrorState());
      return 0;
    }
  }

  Future<int> logIn(String email, String password, {String? diffRole}) async {
    emit(LoadingState());

    final pref = await SharedPreferences.getInstance();
    String? role = diffRole ?? pref.getString("role");

    var dio = Dio();
    try {
      final response = await dio.post(
        "https://dawiny.herokuapp.com/api/auth/login",
        data: jsonEncode({
          "email": email,
          "password": password,
          "role": role,
        }),
      );

      if (response.statusCode == 200) {
        print(response.data);
        accessToken = response.data['access'];
        refreshToken = response.data['refresh'];

        await pref.setString('access', accessToken!);
        await pref.setString('refresh', refreshToken!);
        await pref.setString('role', role!);
        print(accessToken);
        print(refreshToken);
        if (role == "nurse") {
          return await updatePProfile(data: {"status": "online"});
        } else if (role == "patient") {
          return 2;
        }
      }

      emit(DoneState());
      return 1;
    } on DioError catch (ex) {
      errorMsg = null;
      if (ex.response == null || ex.response!.data is! Map) {
        errorMsg = "something went wrong, please try again later";
      } else {
        errorMsg = ex.response!.data['msg'];
      }
      print(ex);

      print(ex.response);

      emit(ErrorState());
      return 0;
    }
  }

  Future refreshAccessToken() async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    refreshToken = prefs.getString("refresh");
    try {
      final rr = await dio.post("https://dawiny.herokuapp.com/api/auth/token",
          options: Options(
            headers: {},
          ),
          data: jsonEncode({
            "refresh": refreshToken,
          }));
      print(rr);
      return rr.data['access'];
    } on DioError catch (ex) {
      if (ex.response == null || ex.response!.data is! Map) {
        errorMsg = "something went wrong, please try again later";
      } else {
        errorMsg = ex.response!.data['msg'];
      }

      return -1;
    }
  }

  Future logout() async {
    emit(LoadingState());

    SharedPreferences pref = await SharedPreferences.getInstance();
    accessToken = pref.getString('access');
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
      pref.setString("refresh", " ");
    } else {
      var result = await refreshAccessToken();
      if (result == -1) {
        //make user login again
      } else {
        await pref.setString("access", result.toString());
        accessToken = result as String?;
        logout();
      }
    }
  }

  Future<int> updatePProfile({required Map data}) async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("access");
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
      String role = payload['role'];
      print(payload);
      print(accessToken);
      if ((role == "patient" || role == "nurse") &&
          data["clinicAddress"] != null) {
        data.addAll({"address": data["clinicAddress"]});
        data.remove("clinicAddress");
      }
      print(data);
      try {
        var response = dio.patch(
            'https://dawiny.herokuapp.com/api/' +
                role +
                's/' +
                payload['userId'],
            data: jsonEncode(data),
            options: Options(headers: {
              'authorization': accessToken,
            }));
        if (role == "doctor") {
          return 1;
        } else if (role == "nurse") {
          return 3;
        } else {
          return 2;
        }
      } on DioError catch (ex) {
        print(ex.response);
        if (ex.response!.statusCode == 400) {
          errorMsg = ex.response!.data['msg'];
        } else {
          errorMsg = ex.response!.data['msg'];
        }
        emit(ErrorState());
        return 0;
      } catch (ex) {
        errorMsg = "something went wrong";
        emit(ErrorState());
        return 0;
      }
    } else {
      var result = await refreshAccessToken();
      if (result == -1) {
        //make user login again
        return 100;
      } else {
        await prefs.setString("access", result.toString());
        accessToken = result as String?;
        return updatePProfile(data: data);
      }
    }
  }

  Future getNurseById({required String id}) async {
    if (count == 0) {
      print(count);

      count++;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      accessToken = prefs.getString("access");
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      if (checkValidAccess(payload['exp'])) {
        try {
          String url = "https://dawiny.herokuapp.com/api/nurses/" + id;
          emit(LoadingState());
          var dio = Dio();

          var response = await dio.get(url,
              options: Options(headers: {
                'authorization': accessToken,
              }));
          nurse = response.data;
          emit(DoneState());
        } on DioError catch (ex) {
          errorMsg = ex.response!.data['msg'];
          print(errorMsg);
          emit(ErrorState());
        }
      } else {
        var result = await refreshAccessToken();
        if (result == -1) {
          //make user login again
        } else {
          await prefs.setString("access", result.toString());
          accessToken = result as String?;
          count = 0;
          getNurseById(id: id);
        }
      }
    }
  }

  Future<dynamic> uploadFile(String imagePath) async {
    try {
      var data =
          FormData.fromMap({'image': await MultipartFile.fromFile(imagePath)});
      var response = await Dio()
          .post('https://dawiny.herokuapp.com/api/upload', data: data);
      print("response::::::::::::::::::::::::::::::  ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        urlImage = response.data['url'];
        print("$urlImage ::::${response.data['url']}");
        return (response.data);
      }
    } on DioError catch (ex) {
      print("Dio Error::::::::: ${ex.response!.data}");
      if (ex.response!.statusCode == 404) {
        errorMsg = ex.response!.data['msg'];
      } else if (ex.response!.statusCode == 401) {
        errorMsg = ex.response!.data['msg'];
      } else {
        errorMsg = ex.response!.data['msg'];
      }
    }

    return [];
  }

  Future<List?> getNearestNurses(double lat, double lng) async {
    try {
      final dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      accessToken = prefs.getString("access");
      var response = await dio.get(
        "https://dawiny.herokuapp.com/api/nurses?lat=$lat&lng=$lng",
        options: Options(
          headers: {
            "authorization": accessToken,
          },
        ),
      );
      print("response::  ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }
    } on DioError catch (ex) {
      print("Dio Error::::::::: ${ex.response!.data}");
      if (ex.response!.statusCode == 404) {
        errorMsg = ex.response!.data['msg'];
      } else if (ex.response!.statusCode == 401) {
        errorMsg = ex.response!.data['msg'];
      } else {
        errorMsg = ex.response!.data['msg'];
      }
    }
    return [];
  }

  Future updateLocation() async {
    if (count == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      accessToken = prefs.getString("access");
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      count++;
      print(count);
      if (payload['role'] == "nurse") {
        await getLocation();
        await updatePProfile(data: {
          "location": {
            "lat": initialPosition!.latitude,
            "lng": initialPosition!.longitude
          }
        });
        print("10 sec start");
        await Future.delayed(const Duration(seconds: 10));
        print("10 sec end");
        count = 0;
        emit(DoneState());
      }
    }
  }

  Future<void> getLocation({value}) async {
    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted = await location.hasPermission();
    LocationData _locationData;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      _locationData = await location.getLocation();
      if (value == null) {
        initialPosition =
            LatLng(_locationData.latitude!, _locationData.longitude!);
      } else {
        location.onLocationChanged.listen((LocationData currentLocation) {
          initialPosition = value;
        });
      }
      emit(GetLocationState());
    }
  }

  Future<LocationData?> geCurrentLocation() async {
    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted = await location.hasPermission();
    LocationData _locationData;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      _locationData = await location.getLocation();
      return _locationData;
    }
    return null;
  }

  Future getDoctorById({required String id}) async {
    if (count == 0) {
      count++;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      accessToken = prefs.getString("access");
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      if (checkValidAccess(payload['exp'])) {
        try {
          String url = "https://dawiny.herokuapp.com/api/doctors/" + id;
          emit(LoadingState());
          var dio = Dio();

          var response = await dio.get(url,
              options: Options(headers: {
                'authorization': accessToken,
              }));
          doctor = response.data;
          initSlots = response.data['appointments'];
          emit(DoneState());
        } on DioError catch (ex) {
          errorMsg = ex.response!.data['msg'];
          print(errorMsg);
          emit(ErrorState());
        }
      } else {
        var result = await refreshAccessToken();
        if (result == -1) {
          //make user login again
        } else {
          await prefs.setString("access", result.toString());
          accessToken = result as String?;
          count = 0;
          getDoctorById(id: id);
        }
      }
    }
  }

  Future checkDate(
      {required String id,
      required Map data,
      required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("access");
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
      try {
        Dio dio = Dio();
        var respons = await dio.post(
            "https://dawiny.herokuapp.com/api/doctors/" +
                id +
                "/reservations?check=true",
            options: Options(headers: {
              'authorization': accessToken,
            }),
            data: jsonEncode(data));
        print(respons);
        availbeDate = respons.data['available'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            availbeDate
                ? "This time is available right now"
                : "This time is not available right now",
          ),
        ));
        emit(DoneState());
      } on DioError catch (ex) {
        errorMsg = ex.response!.data['msg'];
        print(errorMsg);
        emit(ErrorState());
      }
    } else {
      var result = await refreshAccessToken();
      if (result == -1) {
        //make user login again
      } else {
        await prefs.setString("access", result.toString());
        checkDate(id: id, data: data, context: context);
      }
    }
  }

  Future bookAppointment(
      {required String id,
      required Map data,
      required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("access");
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
      try {
        Dio dio = Dio();
        var respons = await dio.post(
            "https://dawiny.herokuapp.com/api/doctors/" + id + "/reservations",
            options: Options(headers: {
              'authorization': accessToken,
            }),
            data: jsonEncode(data));
        print(respons);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Done"),
        ));
        emit(DoneState());
      } on DioError catch (ex) {
        errorMsg = ex.response!.data['msg'];
        print(errorMsg);
        emit(ErrorState());
      }
    } else {
      var result = await refreshAccessToken();
      if (result == -1) {
        //make user login again
      } else {
        await prefs.setString("access", result.toString());
        accessToken = result as String?;
        bookAppointment(id: id, data: data, context: context);
      }
    }
  }

  Future<List> getMyAppintment() async {
    if (count == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(count);
      count++;
      accessToken = prefs.getString("access");
      print(accessToken);
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      if (checkValidAccess(payload['exp'])) {
        emit(LoadingState());
        try {
          String role = payload['role'];
          Dio dio = Dio();
          var response = await dio.get(
              "https://dawiny.herokuapp.com/api/" +
                  role +
                  "s/" +
                  payload['userId'] +
                  "/reservations",
              options: Options(headers: {
                'authorization': accessToken,
              }));
          myAppointments = response.data;

          print(myAppointments);

          emit(DoneState());
          return myAppointments!;
        } on DioError catch (ex) {
          errorMsg = ex.response!.data['msg'];
          print(errorMsg);
          emit(ErrorState());
          return [];
        }
      } else {
        var result = await refreshAccessToken();
        if (result == -1) {
          //make user login again
          return [100];
        } else {
          await prefs.setString("access", result.toString());
          count = 0;
          return getMyAppintment();
        }
      }
    }
    return [];
  }

  Future<Map> getCurrentUser() async {
    if (count == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      count++;
      print(count++);
      accessToken = prefs.getString("access");
      Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
      String role = payload['role'];
      String id = payload['userId'];
      if (checkValidAccess(payload['exp'])) {
        try {
          emit(LoadingState());
          var dio = Dio();
          var response = await dio.get(
              "https://dawiny.herokuapp.com/api/" + role + "s/" + id,
              options: Options(headers: {
                'authorization': accessToken,
              }));
          currentUser = response.data;
          emit(DoneState());
        } on DioError catch (ex) {
          errorMsg = ex.response!.data['msg'];
          print(errorMsg);
          emit(ErrorState());
        }
      } else {
        var result = await refreshAccessToken();
        if (result == -1) {
          //make user login again
        } else {
          await prefs.setString("access", result.toString());
          count = 0;
          return getCurrentUser();
        }
      }
    }
    return currentUser!;
  }

  bool checkValidAccess(int timeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000)
        .isAfter(DateTime.now());
  }

  Future<int> stayLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    refreshToken = prefs.getString("refresh");
    if (refreshToken != null) {
      if (count == 0) {
        count++;
        print(count++);
        var result = await refreshAccessToken();
        if (result == -1) {
          return 0;
        } else {
          accessToken = result.toString();
          print(accessToken);
          prefs.setString("access", accessToken!);

          Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
          if (payload["role"] == "doctor") {
            return 1;
          } else if (payload["role"] == "nurse") {
            return await updatePProfile(data: {'status': 'online'});
          } else {
            return 2;
          }
        }
      }
    }
    return -1;
  }

  int dateCount = 0;
  filterAppointments(DateTime date) async {
    if (dateCount == 0) {
      dateCount++;
      await getMyAppintment().then((value) {
        initialDate = date;
        print(date.toString().substring(0, 10));
        shownAppointments = myAppointments!
            .where((element) =>
                element['date'] == date.toString().substring(0, 10))
            .toList();
        print(shownAppointments);
        emit(ChangeSelectedDate());
      });
    }
  }

  void changeDate(DateTime date) {
    emit(LoadingDateState());
    initialDate = date;
    int d = initialDate.weekday;
    String? day;
    if (d == 1) {
      day = "Mon";
    } else if (d == 2) {
      day = "Tus";
    } else if (d == 3) {
      day = "Wed";
    } else if (d == 4) {
      day = "Thu";
    } else if (d == 5) {
      day = "Fri";
    } else if (d == 6) {
      day = "Sat";
    } else {
      day = "Sun";
    }
    shownSlots = initSlots
        .where(
          (element) => element['day']
              .toString()
              .toLowerCase()
              .contains(day!.toLowerCase()),
        )
        .toList();
    emit(ChangeSelectedDate());
  }
}
