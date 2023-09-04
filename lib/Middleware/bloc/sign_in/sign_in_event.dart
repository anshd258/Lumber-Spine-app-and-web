// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent({
    required this.emailValue,
    required this.passwordValue,
  });
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent({
    required this.email,
    required this.password,
  });
}
