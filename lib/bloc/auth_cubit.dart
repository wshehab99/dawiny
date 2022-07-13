import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AppStates> {
  AuthCubit(AppStates initialState) : super(InitialAppState());
  static AuthCubit get(context) => BlocProvider.of(context);
  String? accessToken;
  String? refreshToken;
  String? errorMsg;
  bool remeberMeValue = false;

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

  bool checkValidAccess(int timeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000)
        .isAfter(DateTime.now());
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

  void remeberMe(bool value) {
    remeberMeValue = value;
    emit(ChangeRemeberMeValue());
  }

  void backToNormalState() {
    emit(InitialAppState());
  }
}
