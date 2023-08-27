import 'package:data_hub/UI/screens/otp_screen.dart';
import 'package:data_hub/UI/screens/sign_up.dart';
import 'package:data_hub/UI/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../UI/screens/signin_screen.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),
  '/signup_screen': (context) => const SignUpScreen(),
  '/signin_screen': (context) => SignInScreen(),
  // '/otp_screen': (context) => OTPScreen(),
};
