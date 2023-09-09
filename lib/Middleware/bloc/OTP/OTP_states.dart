abstract class OTPState {}

class OTPInitialState extends OTPState {}

class OTPVerifiedState extends OTPState {}

class OTPErrorState extends OTPState {
  final String errorMessage;

  OTPErrorState({required this.errorMessage});
}
