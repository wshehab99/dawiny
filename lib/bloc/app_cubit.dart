import 'dart:math';

import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../fake_data/fake_data.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(InitialAppState());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isPasswordShown = false;
  bool remeberMeValue = false;
  PageController controller = PageController();
  int curentPage = 0;
  String? dropdownValue;
  List<SpecializationData> shownList = FakeData.specializations;
  List shownDctors = [];
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

  void changDropdownValue(String value) {
    dropdownValue = value;
    emit(state);
  }
}
