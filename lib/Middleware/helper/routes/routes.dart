import 'package:data_hub/UI/screens/about_screen.dart';
import 'package:data_hub/UI/screens/sign_up.dart';
import 'package:data_hub/UI/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../UI/screens/country_screen.dart';
import '../../../UI/screens/signin_screen.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),
  '/signup_screen': (context) => const SignUpScreen(),
  '/signin_screen': (context) => SignInScreen(),
  '/country_screen': (context) => const CountryScreen(),
  '/about_screen': (context) => AboutScreen(),
  // '/otp_screen': (context) => OTPScreen(),
};
