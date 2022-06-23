abstract class AppStates {}

class InitialAppState extends AppStates {}

class ChangeWelcomePage extends AppStates {}

class ChangeRemeberMeValue extends AppStates {}

class ShowUnShowPassword extends AppStates {}

class GetLocation extends AppStates {}

class SpecializationsSearch extends AppStates {}

class DoctrosSearch extends AppStates {}

class ChangeNurseCheckBoxValue extends AppStates {}

class ChangeDropdownValue extends AppStates {}

class ChangeNurseListButtonValue extends AppStates {}

class LoadingSymptom extends AppStates {}

class ChangeSelectedDate extends AppStates {}

class LoadingState extends AppStates {}

class ErrorState extends AppStates {
  ErrorState({this.errorMsg});
  String? errorMsg;
}

class DoneState extends AppStates {}
