import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(InitialAppState());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isPasswordShown = false;
  bool remeberMeValue = false;
  PageController controller = PageController();
  int curentPage = 0;
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
}
