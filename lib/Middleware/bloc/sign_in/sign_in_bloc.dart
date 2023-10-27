import 'dart:convert';
import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
import 'package:data_hub/Middleware/constants/ApiPaths.dart';
import 'package:path_provider/path_provider.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
// Create storage
     



// final cookieJar = PersistCookieJar(
//   ignoreExpires: true,
 
// );
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

    on<SignInSubmittedEvent>((event, emit) async {
      Map<String, dynamic> body = {
        "email": event.email,
        "password": event.password
      };
      http.Response res = await http.post(Uri.parse(baseUrl + signIn),
          body: json.encode(body), headers: header);
      if (res.statusCode == 200) {
        String uuid = json.decode(res.body)['userID'];
    //     List<Cookie> cookies = [Cookie('Uuid', uuid), ];
        
    //     //  await cookieJar.saveFromResponse(Uri.parse(baseUrl), cookies);
       
        emit(SignInSubmittedState(Uuid: uuid));
      }
    });
  //   on<SignInAutoLogin>(
  //     (event, emit) async {
  //       print("called");
  //       List<Cookie> results = await cookieJar.loadForRequest(Uri.parse(baseUrl));
  // print(results);
  //       print(results.first.value);
  //       // uuid != null ? emit(SignInSubmittedState(Uuid: uuid)) : null;
  //     },
  //   );
  }
}
