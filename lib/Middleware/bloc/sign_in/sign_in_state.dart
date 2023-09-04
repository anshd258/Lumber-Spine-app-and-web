// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(
    this.errorMessage,
  );
}

class SignInSubmittedState extends SignInState{}