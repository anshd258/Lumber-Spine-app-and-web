// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_otp/email_otp.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpValidState extends SignUpState {}

class SignUpNameErrorState extends SignUpState {
  final String errorMessage;
  SignUpNameErrorState(
    this.errorMessage,
  );
}

class SignUpEmailErrorState extends SignUpState {
  final String errorMessage;
  SignUpEmailErrorState(
    this.errorMessage,
  );
}

class SignUpPasswordErrorState extends SignUpState {
  final String errorMessage;
  SignUpPasswordErrorState(
    this.errorMessage,
  );
}

class SignUpSubmittedState extends SignUpState {
  String Uuid;
  SignUpSubmittedState({required this.Uuid});
}

class OTPSentState extends SignUpState {
  final EmailOTP myAuth;
  OTPSentState({
    required this.myAuth,
  });
}

class OTPErrorState extends SignUpState {
  final String errorMessage;
  OTPErrorState(
    this.errorMessage,
  );
}
