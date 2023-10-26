// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInEmailErrorState extends SignInState {
  final String errorMessage;
  SignInEmailErrorState(
    this.errorMessage,
  );
}

class SignInPasswordErrorState extends SignInState {
  final String errorMessage;
  SignInPasswordErrorState(
    this.errorMessage,
  );
}

class SignInSubmittedState extends SignInState {
  String Uuid;
  SignInSubmittedState({required this.Uuid});
}
