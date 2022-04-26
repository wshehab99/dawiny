import 'package:dawiny/model/user.dart';

class Doctor extends User {
  Doctor(
      {required String email,
      required String password,
      required String fullName,
      required String this.hospitalName,
      required String profilePhoto,
      this.specialist})
      : super(
          email: email,
          password: password,
          fullName: fullName,
          profilePhoto: profilePhoto,
        );
  String? specialist;
  String? hospitalName;
}
