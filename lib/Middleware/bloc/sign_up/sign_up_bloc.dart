import 'dart:convert';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_events.dart';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_states.dart';
import 'package:data_hub/Middleware/constants/ApiPaths.dart';
import 'package:email_otp/email_otp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpNameChangedEvent>((event, emit) {
      if (event.nameValue == "" ||
          !RegExp(r'^[a-z A-Z]+$').hasMatch(event.nameValue)) {
        emit(SignUpNameErrorState("Please enter your name"));
      }
    });

    on<SignUpEmailChangedEvent>((event, emit) {
      if (event.emailValue == "" ||
          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
              .hasMatch(event.emailValue)) {
        emit(SignUpEmailErrorState("Please enter a valid email address"));
      } else {
        emit(SignUpValidState());
      }
    });

    on<SignUpPasswordChangedEvent>((event, emit) {
      if (event.passwordValue.length < 6) {
        emit(SignUpPasswordErrorState(
            "Password should be atleast 6 characters long"));
      } else {
        emit(SignUpValidState());
      }
    });

    on<SignUpSubmittedEvent>((event, emit) async {
      Map<String, dynamic> body = {
        "name": event.name,
        "email": event.email,
        "password": event.password
      };
     
      
      http.Response res = await http.post(
        Uri.parse(baseUrl + signup),
        headers: header,
        body: json.encode(body),
      );
     
      if (res.statusCode == 200) {
        print(res.body);
        emit(SignUpSubmittedState(Uuid: json.decode(res.body)['userID']));
      }
    });

    on<SendOTPEvent>((event, emit) async {
      EmailOTP myauth = EmailOTP();
      try {
        myauth.setConfig(
          appEmail: "gagandeep4989@gmail.com",
          appName: "Data Hub",
          userEmail: event.email, // Use the email from the event
          otpLength: 4,
          otpType: OTPType.digitsOnly,
        );

        if (await myauth.sendOTP() == true) {
          emit(OTPSentState(myAuth: myauth));
        } else {
          emit(OTPErrorState('OTP could not be sent'));
        }
      } catch (error) {
        emit(OTPErrorState('An error occurred'));
      }
    });
  }
}
