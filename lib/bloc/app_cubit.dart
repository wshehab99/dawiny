import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fake_data/fake_data.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(InitialAppState());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  static LatLng? initialPosition;
  Location location = Location();
  bool isPasswordShown = false;
  bool remeberMeValue = false;
  PageController controller = PageController();
  int curentPage = 0;
  static String? dropdownValue;
  List<SpecializationData> shownList = FakeData.specializations;
  bool nursingListContinue = false;
  DateTime initialDate = DateTime.now();
  List shownDctors = [];
  String symptomText =
      'Itching,Skin Rash,Nodal Skin Eruptions,Continuous Sneezing,Shivering,Chills,Joint Pain,Stomach Pain,Acidity,Ulcers On Tongue,Muscle Wasting,Vomiting,Burning Micturition,Spotting  urination,Fatigue,Weight Gain,Anxiety,Cold Hands And Feets,Mood Swings,Weight Loss,Restlessness,Lethargy,Patches In Throat,Irregular Sugar Level,Cough,High Fever,Sunken Eyes,Breathlessness,Sweating,Dehydration,Indigestion,Headache,Yellowish Skin,Dark Urine,Nausea,Loss Of Appetite,Pain Behind The Eyes,Back Pain,Constipation,Abdominal Pain,Diarrhoea,Mild Fever,Yellow Urine,Yellowing Of Eyes,Acute Liver Failure,Fluid Overload,Swelling Of Stomach,Swelled Lymph Nodes,Malaise,Blurred And Distorted Vision,Phlegm,Throat Irritation,Redness Of Eyes,Sinus Pressure,Runny Nose,Congestion,Chest Pain,Weakness In Limbs,Fast Heart Rate,Pain During Bowel Movements,Pain In Anal Region,Bloody Stool,Irritation In Anus,Neck Pain,Dizziness,Cramps,Bruising,Obesity,Swollen Legs,Swollen Blood Vessels,Puffy Face And Eyes,Enlarged Thyroid,Brittle Nails,Swollen Extremeties,Excessive Hunger,Extra Marital Contacts,Drying And Tingling Lips,Slurred Speech,Knee Pain,Hip Joint Pain,Muscle Weakness,Stiff Neck,Swelling Joints,Movement Stiffness,Spinning Movements,Loss Of Balance,Unsteadiness,Weakness Of One Body Side,Loss Of Smell,Bladder Discomfort,Foul Smell Of urine,Continuous Feel Of Urine,Passage Of Gases,Internal Itching,Toxic Look (typhos),Depression,Irritability,Muscle Pain,Altered Sensorium,Red Spots Over Body,Belly Pain,Abnormal Menstruation,Dischromic  Patches,Watering From Eyes,Increased Appetite,Polyuria,Family History,Mucoid Sputum,Rusty Sputum,Lack Of Concentration,Visual Disturbances,Receiving Blood Transfusion,Receiving Unsterile Injections,Coma,Stomach Bleeding,Distention Of Abdomen,History Of Alcohol Consumption,Fluid Overload.1,Blood In Sputum,Prominent Veins On Calf,Palpitations,Painful Walking,Pus Filled Pimples,Blackheads,Scurring,Skin Peeling,Silver Like Dusting,Small Dents In Nails,Inflammatory Nails,Blister,Red Sore Around Nose,Yellow Crust Ooze,Prognosis,';
  static List symptomList = [];
  List selectedSymptoms = [];
  List veiwedSymptoms = [];
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
  ];
  List availableTimes = [
    {
      'time': const TimeOfDay(hour: 9, minute: 30),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 10, minute: 00),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 10, minute: 30),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 11, minute: 00),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 11, minute: 30),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 12, minute: 00),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 12, minute: 30),
      'isSelected': false,
    },
    {
      'time': const TimeOfDay(hour: 01, minute: 00),
      'isSelected': false,
    },
  ];
  var apiMlModel = Uri.parse("https://dawinyml.herokuapp.com/ml");
  String? errorMsg;
  String? accessToken;
  String? refreshToken;
  void changePage(int value) {
    curentPage = value;
    emit(ChangeWelcomePage());
  }

  void remeberMe(bool value) {
    remeberMeValue = value;
    emit(ChangeRemeberMeValue());
  }

  void showUnShowPassword() {
    isPasswordShown = !isPasswordShown;
    emit(ShowUnShowPassword());
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
      emit(GetLocation());
    }
  }

  void searchOnSpecializations(String value) {
    shownList = FakeData.specializations.where((element) {
      return element.name.toLowerCase().contains(value);
    }).toList();
    emit(SpecializationsSearch());
  }

  List searchAboutDoctor(String dignoseName, String value, bool? video) {
    shownDctors = FakeData.doctors
        .where(
          (element) => (element.specialist == dignoseName &&
              (video == null ? true : element.videocall == true) &&
              element.fullName!.toLowerCase().contains(value)),
        )
        .toList();
    emit(DoctrosSearch());
    return shownDctors;
  }

  Future getDoctor() async {
    emit(LoadingState());
    final pref = await SharedPreferences.getInstance();
    try {
      var dio = Dio();
      accessToken = pref.getString("access");
      var response = await dio.get("https://dawiny.herokuapp.com/api/doctors",
          options: Options(headers: {
            "authorization": accessToken,
          }));
      shownDctors = response.data;
      print(shownDctors);
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        var result = refreshAccessToken();
        if (result == -1) {
        } else {
          pref.setString("access", result.toString());
          getDoctor();
        }
      } else {
        emit(ErrorState());
      }
    }
  }

  void changeDropdownValue(String value) {
    dropdownValue = value;
    emit(ChangeDropdownValue());
  }

  void changeNurseValue(bool value, int index) {
    nursingTsks[index].update("value", (value1) => value);
    nursingTsks.elementAt(index);
    emit(ChangeNurseCheckBoxValue());
  }

  void changeNurseListBouttonValue() {
    //print(nursingTsks);
    var x = nursingTsks.indexWhere((element) => element['value'] == true);

    if (x != -1) {
      nursingListContinue = true;
    } else {
      nursingListContinue = false;
    }
    emit(ChangeNurseListButtonValue());
  }

  void loadingSymptom() {
    symptomList = symptomText.split(",");
  }

  void changeDate(DateTime date) {
    initialDate = date;
    emit(ChangeSelectedDate());
  }

  void selectTime(int index) {
    for (int i = 0; i < availableTimes.length; i++) {
      if (availableTimes[i]['isSelected'] == true) {
        availableTimes[i]['isSelected'] == false;
        break;
      }
    }
    availableTimes[index]['isSelected'] = !availableTimes[index]['isSelected'];
    emit(ChangeNurseCheckBoxValue());
  }

  void selectSymptoms(int index) {
    if (selectedSymptoms.contains(veiwedSymptoms[index])) {
    } else {
      selectedSymptoms.add(veiwedSymptoms[index]);
    }
    emit(LoadingSymptom());
  }

  void searchOnSymptoms({String? value}) {
    if (value!.isEmpty) {
      veiwedSymptoms = [];
    } else {
      veiwedSymptoms = symptomList
          .where((element) => element.toString().contains(value))
          .toList();
    }
    emit(LoadingSymptom());
  }

  void deleteSymptom(int index) {
    selectedSymptoms.removeAt(index);
    emit(LoadingSymptom());
  }

  Future<String> medicalDiagnosis() async {
    emit(LoadingState());

    var dio = Dio();
    final response = await dio.post("https://dawinyml.herokuapp.com/api/ml",
        data: jsonEncode({"symptoms": selectedSymptoms}));
    if (response.statusCode == 200) {
      emit(DoneState());
      return response.data['disease'];
    } else {
      emit(ErrorState());

      return "";
    }
  }

  void backToNormalState() {
    emit(InitialAppState());
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
    if (role == "doctor") {
      url = "doctors";
    } else if (role == "nurse") {
      url = "nurses";
    } else {
      url = "patients";
    }
    try {
      var response = await dio.post(
        "https://dawiny.herokuapp.com/api/" + url,
        data: jsonEncode({
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        }),
      );

      print(response.data);

      if (response.statusCode == 201) {
        print(
            "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++morsy m4 salk");
        accessToken = response.data['access'];
        refreshToken = response.data['refresh'];
        final pref = await SharedPreferences.getInstance();
        await pref.setString('access', accessToken!);
        await pref.setString('refresh', refreshToken!);

        emit(DoneState());
      }
      return 1;
    } on DioError catch (ex) {
      errorMsg = null;
      print("Dio Error::::::::: ${ex.response!.data}");
      if (ex.response!.statusCode == 404) {
        errorMsg = ex.response!.data['msg'];
      } else if (ex.response!.statusCode == 401) {
        errorMsg = ex.response!.data['msg'];
      } else {
        errorMsg = ex.response!.data['msg'];
      }
      emit(ErrorState());
      return 0;
    }
  }

  Future<int> logIn(String email, String password, String role) async {
    emit(LoadingState());
    try {
      final pref = await SharedPreferences.getInstance();
      var dio = Dio();
      final response = await dio.post(
        "https://dawiny.herokuapp.com/api/auth/login",
        data: jsonEncode({
          "email": email,
          "password": password,
          "role": role,
        }),
      );
      print(response.data);

      if (response.statusCode == 200) {
        accessToken = response.data['access'];
        refreshToken = response.data['refresh'];

        await pref.setString('access', accessToken!);
        await pref.setString('refresh', refreshToken!);
        emit(DoneState());
      } else if (response.statusCode == 404) {
        print(response.data['error']);
        errorMsg = response.data['error'];
        emit(ErrorState());
      } else {
        errorMsg = response.data['error'];
        emit(ErrorState());
      }
      emit(DoneState());
      return 1;
    } on DioError catch (ex) {
      errorMsg = null;
      if (ex.response!.statusCode == 404) {
        errorMsg = ex.response!.data['msg'];
      } else if (ex.response!.statusCode == 401) {
        errorMsg = ex.response!.data['msg'];
      }
      print(ex.response);
      print(ex.response!.statusCode);

      emit(ErrorState());
      return 0;
    }
  }

  Future refreshAccessToken() async {
    var dio = Dio();

    final rr = await dio.post("https://dawiny.herokuapp.com/api/auth/token",
        options: Options(
          headers: {},
        ),
        data: jsonEncode({
          "refresh": refreshToken,
        }));
    if (rr.statusCode == 200) {
      return rr.data['access'];
    } else {
      return -1;
    }
  }

  Future requestOnServer(String email, String password, String role) async {
    emit(LoadingState());
    final pref = await SharedPreferences.getInstance();
    accessToken = pref.getString("access");
    refreshToken = pref.getString("refresh");
    var dio = Dio();
    final response = await dio.post(
      "https://dawiny.herokuapp.com/auth/login",
      options: Options(headers: {
        "authorization": accessToken,
      }),
      data: jsonEncode({
        "email": email,
        "password": password,
        "role": role,
      }),
    );
    if (response.statusCode == 200) {
      emit(DoneState());
      return response.data['disease'];
    } else if (response.statusCode! == 401) {
      var result = refreshAccessToken();
      if (result == -1) {
        //make user login again
      } else {
        await pref.setString("access", result.toString());
        accessToken = result as String?;
        logIn(email, password, role);
      }
    } else {
      errorMsg = response.statusMessage;
      emit(ErrorState());
      return "";
    }
  }

  Future logout() async {
    emit(LoadingState());
    SharedPreferences pref = await SharedPreferences.getInstance();
    accessToken = pref.getString('access');
    var dio = Dio();
    final response =
        await dio.delete("https://dawiny.herokuapp.com/api/auth/logout",
            options: Options(
              headers: {
                'authorization': accessToken,
              },
            ),
            data: jsonEncode({
              "refresh": refreshToken,
            }));

    try {
      if (response.statusCode == 200) {
        emit(DoneState());
      } else if (response.statusCode! == 401) {
        var result = refreshAccessToken();
        if (result == -1) {
          //make user login again
        } else {
          await pref.setString("access", result.toString());
          accessToken = result as String?;
          logout();
        }
      }
    } on DioError catch (e) {
      errorMsg = response.statusMessage;
      emit(ErrorState());
    }
    // if (response.statusCode == 200) {
    //   emit(DoneState());
    // } else if (response.statusCode! == 401) {
    //   var result = refreshAccessToken();
    //   if (result == -1) {
    //     //make user login again
    //   } else {
    //     await pref.setString("access", result.toString());
    //     accessToken = result as String?;
    //     logout();
    //   }
    // } else {
    //   errorMsg = response.statusMessage;
    //   emit(ErrorState());
    // }
  }


  Future<int> updatePProfile({required Map data}) async {
    emit(LoadingState());

    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("access");
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    String role = payload['role'];
    print(payload);
    print(accessToken);
    if (role == "patient") {
      data.update('address', (value) => data["clinicAddress"]);
      data.remove("clinicAddress");
    } else if (role == "nurse") {
      data.remove("clinicAddress");
    }
    print(data);
    try {
      var response = dio.patch(
          'https://dawiny.herokuapp.com/api/' + role + 's/' + payload['userId'],
          data: jsonEncode(data),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: accessToken,
          }));
      emit(DoneState());
      return 1;
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

}
