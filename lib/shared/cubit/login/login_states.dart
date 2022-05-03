abstract class LoginStates {}


class LoginLoadingState extends LoginStates {}

class LoginInitState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uId;
  LoginSuccessState(this.uId);
}

class SocialSuffixState extends LoginStates {}

class LoginErrorState extends LoginStates {
  late final String error;

  LoginErrorState(this.error);
}