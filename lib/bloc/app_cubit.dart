import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
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
  List? initDctors;
  Map? doctor;
  Map? currentUser = {};
  bool availbeDate = false;
  String userType = 'Doctor';
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
    {
      "title": 'Performing diagnostic tests',
      "description":
          'Nurses may perform a wide variety of diagnostic tests, including checking vitals and collecting tissue, blood.',
      "value": false,
    },
  ];
  Map spac = {
    "(vertigo) Paroymsal Positional Vertigo": " ear specialist",
    "AIDS": "internists",
    "Acne": "Dermatology specialty",
    "Alcoholic hepatitis": "Transplant Hepatologist specialist",
    "Allergy": "Dermatology specialty",
    "Arthritis": "orthopedic specialty",
    "Bronchial Asthma": "Chest diseases specialization",
    "Cervical spondylosis": "Neurosurgery",
    "Chicken pox": "Dermatology specialty",
    "Chronic cholestasis": "Transplant Hepatologist specialist",
    "Common Cold ": "internists",
    "Dengue": "internists",
    "Diabetes": "internists",
    "Dimorphic hemmorhoids(piles)": "Urology specialty",
    "Drug Reaction": "Pharmacist's specialty",
    "Fungal infection": "Dermatology specialty",
    "GERD": "internists",
    "Gastroenteritis": "Gastrointestinal specialty",
    "Heart attack": "Cardiology specialization",
    "Hepatitis B": "Transplant Hepatologist specialist",
    "Hepatitis C": "Transplant Hepatologist specialist",
    "Hepatitis D": "Transplant Hepatologist specialist",
    "Hepatitis E": "Transplant Hepatologist specialist",
    "Hypertension": "internists",
    "Hyperthyroidism": "Dermatology specialty",
    "Hypoglycemia ": "internists",
    "Hypothyroidism": "Dermatology specialty",
    "Impetigo": "Dermatology specialty",
    "Jaundice": "eyes specialty",
    "Malaria": "internists",
    "Migraine": "internists",
    "Osteoarthristis ": "orthopedic specialty",
    "Paralysis (brain hemorrhage)": "Neuroscience specialization",
    "Peptic ulcer diseae": "internists",
    "Pneumonia": "chest diseases specialization",
    "Psoriasis": "orthopedic specialty",
    "Tuberculosis": "Chest diseases specialization",
    "Typhoid": "internists",
    "Urinary tract infection": "Urology specialty",
    "Varicose veins": "Neurosurgery",
    "hepatitis A": "Transplant Hepatologist specialist",
  };
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
  List initSlots = [];
  List shownSlots = [];
  List? myAppointments;
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

  void changeDropdownValue(String value) {
    dropdownValue = value;
    emit(ChangeDropdownValue());
  }

  Future getDoctor() async {
    if (initDctors == null) {
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

  Future<Map> medicalDiagnosis() async {
    emit(LoadingState());

    var dio = Dio();
    final response = await dio.post("https://dawinyml.herokuapp.com/api/ml",
        data: jsonEncode({"symptoms": selectedSymptoms}));
    Map? result;
    if (response.statusCode == 200) {
      String disease = response.data['disease'];

      spac.forEach(
        (key, value) {
          if (key.toString().contains(disease)) {}
          result = {key: value};
        },
      );
      result ??= {response.data['disease']: " "};

      emit(DoneState());
      return result!;
    } else {
      emit(ErrorState());

      return {" ": " "};
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
        }
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

        print(accessToken);
        print(refreshToken);
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
      errorMsg = ex.response!.data['msg'];

      return -1;
    }
  }

  Future logout() async {
    emit(LoadingState());

    SharedPreferences pref = await SharedPreferences.getInstance();
    accessToken = pref.getString('access');
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
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
        }
      } on DioError {
        errorMsg = response.statusMessage;
        emit(ErrorState());
      }
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

  DateTime timeOfDayMinToInt(TimeOfDay t) {
    return DateTime(2022, 1, 1, t.hour, t.minute);
  }

  Future<int> updatePProfile({required Map data}) async {
    emit(LoadingState());

    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("access");
    Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
    if (checkValidAccess(payload['exp'])) {
      String role = payload['role'];
      print(payload);
      print(accessToken);
      if (role == "patient") {
        data.addAll({"address": data["clinicAddress"]});
        data.remove("clinicAddress");
      } else if (role == "nurse") {
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
        emit(DoneState());
        if (role == "doctor") {
          return 1;
        } else {
          return -1;
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

  Future getDoctorById({required String id}) async {
    if (doctor == null) {
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

  int count = 0;
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
        var result = await refreshAccessToken();
        if (result == -1) {
          return 0;
        } else {
          accessToken = result.toString();
          print(accessToken);
          prefs.setString("access", accessToken!);

          Map<String, dynamic> payload = Jwt.parseJwt(accessToken!);
          if (payload["role"] == "doctor") {
            return 2;
          } else if (payload["role"] == "nurse") {
            return 3;
          } else {
            return 1;
          }
        }
      }
    }
    return -1;
  }
}
