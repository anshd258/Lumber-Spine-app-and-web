import 'sign_in_event.dart';
import 'sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == "" ||
          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
              .hasMatch(event.emailValue)) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 6) {
        emit(SignInErrorState("Password should be atleast 6 characters long"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInSubmittedState());
    });
  }
}
