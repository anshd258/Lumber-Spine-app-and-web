abstract class SignUpEvent{}

class SignUpNameChangedEvent extends SignUpEvent{
  final String nameValue;
  SignUpNameChangedEvent({
    required this.nameValue,
  });
}

class SignUpEmailChangedEvent extends SignUpEvent{
  final String emailValue;
  SignUpEmailChangedEvent({
    required this.emailValue,
  });
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  final String passwordValue;
  SignUpPasswordChangedEvent({
    required this.passwordValue,
  });
}

class SignUpSubmittedEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  SignUpSubmittedEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class SendOTPEvent extends SignUpEvent {
  final String email;
  SendOTPEvent({
    required this.email,
  });
}