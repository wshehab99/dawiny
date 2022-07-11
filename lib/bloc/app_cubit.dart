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

  PageController controller = PageController();
  int curentPage = 0;
  static String? dropdownValue;
  List<SpecializationData> shownList = FakeData.specializations;

  void changePage(int value) {
    curentPage = value;
    emit(ChangeWelcomePage());
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

  void changeDropdownValue(String value) {
    dropdownValue = value;
    emit(ChangeDropdownValue());
  }
}
