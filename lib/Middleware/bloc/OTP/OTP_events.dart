// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_otp/email_otp.dart';

abstract class OTPEvent {}

class OTPVerifyEvent extends OTPEvent {
  final String otp;
  final EmailOTP myAuth;

  OTPVerifyEvent({
    required this.otp,
    required this.myAuth,
  });
}
