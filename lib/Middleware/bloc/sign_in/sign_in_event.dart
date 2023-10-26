// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvent {}

class SignInEmailChangedEvent extends SignInEvent {
  final String emailValue;
  SignInEmailChangedEvent({
    required this.emailValue,
  });
}

class SignInAutoLogin extends SignInEvent{
  
}

class SignInPasswordChangedEvent extends SignInEvent {
  final String passwordValue;
  SignInPasswordChangedEvent({
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


