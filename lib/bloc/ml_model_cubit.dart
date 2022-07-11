import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class ModelCubit extends Cubit<AppStates> {
  ModelCubit(AppStates initialState) : super(InitialAppState());
  static ModelCubit get(context) => BlocProvider.of(context);
  String symptomText =
      'Itching,Skin Rash,Nodal Skin Eruptions,Continuous Sneezing,Shivering,Chills,Joint Pain,Stomach Pain,Acidity,Ulcers On Tongue,Muscle Wasting,Vomiting,Burning Micturition,Spotting  urination,Fatigue,Weight Gain,Anxiety,Cold Hands And Feets,Mood Swings,Weight Loss,Restlessness,Lethargy,Patches In Throat,Irregular Sugar Level,Cough,High Fever,Sunken Eyes,Breathlessness,Sweating,Dehydration,Indigestion,Headache,Yellowish Skin,Dark Urine,Nausea,Loss Of Appetite,Pain Behind The Eyes,Back Pain,Constipation,Abdominal Pain,Diarrhoea,Mild Fever,Yellow Urine,Yellowing Of Eyes,Acute Liver Failure,Fluid Overload,Swelling Of Stomach,Swelled Lymph Nodes,Malaise,Blurred And Distorted Vision,Phlegm,Throat Irritation,Redness Of Eyes,Sinus Pressure,Runny Nose,Congestion,Chest Pain,Weakness In Limbs,Fast Heart Rate,Pain During Bowel Movements,Pain In Anal Region,Bloody Stool,Irritation In Anus,Neck Pain,Dizziness,Cramps,Bruising,Obesity,Swollen Legs,Swollen Blood Vessels,Puffy Face And Eyes,Enlarged Thyroid,Brittle Nails,Swollen Extremeties,Excessive Hunger,Extra Marital Contacts,Drying And Tingling Lips,Slurred Speech,Knee Pain,Hip Joint Pain,Muscle Weakness,Stiff Neck,Swelling Joints,Movement Stiffness,Spinning Movements,Loss Of Balance,Unsteadiness,Weakness Of One Body Side,Loss Of Smell,Bladder Discomfort,Foul Smell Of urine,Continuous Feel Of Urine,Passage Of Gases,Internal Itching,Toxic Look (typhos),Depression,Irritability,Muscle Pain,Altered Sensorium,Red Spots Over Body,Belly Pain,Abnormal Menstruation,Dischromic  Patches,Watering From Eyes,Increased Appetite,Polyuria,Family History,Mucoid Sputum,Rusty Sputum,Lack Of Concentration,Visual Disturbances,Receiving Blood Transfusion,Receiving Unsterile Injections,Coma,Stomach Bleeding,Distention Of Abdomen,History Of Alcohol Consumption,Fluid Overload.1,Blood In Sputum,Prominent Veins On Calf,Palpitations,Painful Walking,Pus Filled Pimples,Blackheads,Scurring,Skin Peeling,Silver Like Dusting,Small Dents In Nails,Inflammatory Nails,Blister,Red Sore Around Nose,Yellow Crust Ooze,Prognosis,';
  static List symptomList = [];
  List selectedSymptoms = [];
  List veiwedSymptoms = [];
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
  String? errorMsg;

  void loadingSymptom() {
    symptomList = symptomText.split(",");
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
          .where((element) => element.toString().toLowerCase().contains(value))
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

    try {
      var dio = Dio();
      final response = await dio.post("https://dawinyml.herokuapp.com/api/ml",
          data: jsonEncode({"symptoms": selectedSymptoms}));
      Map? result;

      String disease = response.data['disease'];

      spac.forEach(
        (key, value) {
          if (key.toString().contains(disease)) {}
          result = {disease: value};
        },
      );
      result ??= {response.data['disease']: " "};

      emit(DoneState());
      return result!;
    } on DioError catch (ex) {
      errorMsg = ex.response!.data['msg'] ??
          "something went wrong please try agine later";

      emit(ErrorState());

      return {" ": " "};
    }
  }

  void backToNormalState() {
    emit(InitialAppState());
  }
}
