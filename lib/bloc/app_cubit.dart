import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../fake_data/fake_data.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(InitialAppState());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  LatLng? initialPosition;
  Location location = Location();
  bool isPasswordShown = false;
  bool remeberMeValue = false;
  PageController controller = PageController();
  int curentPage = 0;
  String? dropdownValue;
  List<SpecializationData> shownList = FakeData.specializations;
  bool nursingListContinue = false;
  DateTime initialDate = DateTime.now();
  List shownDctors = [];
  String symptomText =
      'Itching,Skin Rash,Nodal Skin Eruptions,Continuous Sneezing,Shivering,Chills,Joint Pain,Stomach Pain,Acidity,Ulcers On Tongue,Muscle Wasting,Vomiting,Burning Micturition,Spotting  urination,Fatigue,Weight Gain,Anxiety,Cold Hands And Feets,Mood Swings,Weight Loss,Restlessness,Lethargy,Patches In Throat,Irregular Sugar Level,Cough,High Fever,Sunken Eyes,Breathlessness,Sweating,Dehydration,Indigestion,Headache,Yellowish Skin,Dark Urine,Nausea,Loss Of Appetite,Pain Behind The Eyes,Back Pain,Constipation,Abdominal Pain,Diarrhoea,Mild Fever,Yellow Urine,Yellowing Of Eyes,Acute Liver Failure,Fluid Overload,Swelling Of Stomach,Swelled Lymph Nodes,Malaise,Blurred And Distorted Vision,Phlegm,Throat Irritation,Redness Of Eyes,Sinus Pressure,Runny Nose,Congestion,Chest Pain,Weakness In Limbs,Fast Heart Rate,Pain During Bowel Movements,Pain In Anal Region,Bloody Stool,Irritation In Anus,Neck Pain,Dizziness,Cramps,Bruising,Obesity,Swollen Legs,Swollen Blood Vessels,Puffy Face And Eyes,Enlarged Thyroid,Brittle Nails,Swollen Extremeties,Excessive Hunger,Extra Marital Contacts,Drying And Tingling Lips,Slurred Speech,Knee Pain,Hip Joint Pain,Muscle Weakness,Stiff Neck,Swelling Joints,Movement Stiffness,Spinning Movements,Loss Of Balance,Unsteadiness,Weakness Of One Body Side,Loss Of Smell,Bladder Discomfort,Foul Smell Of urine,Continuous Feel Of Urine,Passage Of Gases,Internal Itching,Toxic Look (typhos),Depression,Irritability,Muscle Pain,Altered Sensorium,Red Spots Over Body,Belly Pain,Abnormal Menstruation,Dischromic  Patches,Watering From Eyes,Increased Appetite,Polyuria,Family History,Mucoid Sputum,Rusty Sputum,Lack Of Concentration,Visual Disturbances,Receiving Blood Transfusion,Receiving Unsterile Injections,Coma,Stomach Bleeding,Distention Of Abdomen,History Of Alcohol Consumption,Fluid Overload.1,Blood In Sputum,Prominent Veins On Calf,Palpitations,Painful Walking,Pus Filled Pimples,Blackheads,Scurring,Skin Peeling,Silver Like Dusting,Small Dents In Nails,Inflammatory Nails,Blister,Red Sore Around Nose,Yellow Crust Ooze,Prognosis,';
  static List symptomList = [];
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

  Future<void> getLocation() async {
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
      // var cntrl = await _controller.future;
      // cntrl.animateCamera(CameraUpdate.newLatLng(
      //     LatLng(_locationData.latitude!, _locationData.longitude!)));
      initialPosition =
          LatLng(_locationData.latitude!, _locationData.longitude!);
      emit(GetLocation());
    }
  }

  void searchOnSpecializations(String value) {
    shownList = FakeData.specializations.where((element) {
      return element.name.toLowerCase().contains(value);
    }).toList();
    emit(SpecializationsSearch());
  }

  List searchAboutDoctor(String dignoseName, String value) {
    shownDctors = FakeData.doctors
        .where(
          (element) => (element.specialist == dignoseName &&
              element.fullName!.toLowerCase().contains(value)),
        )
        .toList();
    emit(DoctrosSearch());
    return shownDctors;
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
    emit(LoadingSymptom());
  }

  void changeDate(DateTime date) {
    initialDate = date;
    emit(ChangeSelectedDate());
  }
}
