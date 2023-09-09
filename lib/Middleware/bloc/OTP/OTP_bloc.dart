import 'package:data_hub/Middleware/bloc/OTP/OTP_events.dart';
import 'package:data_hub/Middleware/bloc/OTP/OTP_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> {
  OTPBloc() : super(OTPInitialState()) {
    on<OTPVerifyEvent>((event, emit) async {
      if (await event.myAuth.verifyOTP(otp: event.otp) == true) {
        emit(OTPVerifiedState());
      } else {
        emit(OTPErrorState(errorMessage: "Incorrect OTP"));
      }
    });
  }
}
