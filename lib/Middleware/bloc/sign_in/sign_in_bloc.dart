import 'dart:async';

import 'sign_in_event.dart';
import 'sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEmailChangedEvent>((event, emit) {
      if (event.emailValue == "" ||
          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
              .hasMatch(event.emailValue)) {
        emit(SignInEmailErrorState("Please enter a valid email address"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInPasswordChangedEvent>((event, emit) {
      if (event.passwordValue.length < 6) {
        emit(SignInPasswordErrorState("Please enter correct password"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInSubmittedState());
    });
  }
}
