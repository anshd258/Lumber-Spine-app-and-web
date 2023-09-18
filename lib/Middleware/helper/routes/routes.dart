import 'package:data_hub/Middleware/bloc/sign_in/sign_in_bloc.dart';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_bloc.dart';
import 'package:data_hub/UI/screens/R_factor_screen.dart';
import 'package:data_hub/UI/screens/about_screen.dart';
import 'package:data_hub/UI/screens/analyze_screen.dart';
import 'package:data_hub/UI/screens/checklist_screen.dart';
import 'package:data_hub/UI/screens/graph_screen.dart';
import 'package:data_hub/UI/screens/home_screen.dart';
import 'package:data_hub/UI/screens/instructions_screen.dart';
import 'package:data_hub/UI/screens/registration_completed_screen.dart';
import 'package:data_hub/UI/screens/sign_up.dart';
import 'package:data_hub/UI/screens/splash_screen.dart';
import 'package:data_hub/UI/screens/td_tm_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../UI/screens/country_screen.dart';
import '../../../UI/screens/signin_screen.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => const SplashScreen(),

  '/signin_screen': (context) => BlocProvider(
        create: (context) => SignInBloc(),
        child: SignInScreen(),
      ),

  '/signup_screen': (context) => BlocProvider(
        create: (context) => SignUpBloc(),
        child: const SignUpScreen(),
      ),

  // '/otp_screen': (context) => OTPScreen(),

  '/country_screen': (context) => const CountryScreen(),

  '/about_screen': (context) => AboutScreen(),

  '/registration_completed_screen': (context) =>
      const RegistrationCompletedScreen(),

  '/home_screen': (context) => const HomeScreen(),

  '/analyze_screen': (context) => const AnalyzeScreen(),

  '/instructions_screen': (context) => const Instructions(),

  '/checklist_screen': (context) => const ChecklistScreen(),

  '/td_tm_screen': (context) => TdTmScreen(),

  '/R_factor_screen': (context) => RFactorScreen(),

  '/graph_screen': (context) => const GraphScreen(),
};
