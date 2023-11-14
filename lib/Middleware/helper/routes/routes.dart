import 'package:data_hub/Middleware/bloc/Repository/authrepo.dart';
import 'package:data_hub/Middleware/bloc/sign_in/sign_in_bloc.dart';
import 'package:data_hub/UI/screens/R_factor_screen.dart';

import 'package:data_hub/UI/screens/home_screen.dart';

import 'package:data_hub/UI/screens/history_screen.dart';
import 'package:data_hub/UI/screens/instructions_screen.dart';
import 'package:data_hub/UI/screens/instructions_web.dart';
import 'package:data_hub/UI/screens/profile_screen.dart';
import 'package:data_hub/UI/screens/registration_completed_screen.dart';
import 'package:data_hub/UI/screens/sign_up.dart';
import 'package:data_hub/UI/screens/splash_screen.dart';
import 'package:data_hub/UI/screens/td_tm_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../UI/screens/country_screen.dart';
import '../../../UI/screens/signin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

GoRouter router = GoRouter(
    routes: goo_routes, initialLocation: kIsWeb ? '/' : '/');

List<RouteBase> goo_routes = [
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  GoRoute(
    path: '/signin_screen',
    builder: (context, state) => BlocProvider(
      create: (context) => SignInBloc(RepositoryProvider.of<localStorage>(context)),
      child: SignInScreen(),
    ),
  ),
  GoRoute(
    path: '/signup_screen',
    builder: (context, state) => BlocProvider(
      create: (context) => SignInBloc(RepositoryProvider.of<localStorage>(context)),
      child: const SignUpScreen(),
    ),
  ),
  GoRoute(
      path: '/country_screen',
      builder: (context, state) => const CountryScreen()),
  GoRoute(
      path: '/registration_completed_screen',
      builder: (context, state) => const RegistrationCompletedScreen()),
  GoRoute(
      path: '/home_screen', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/history_screen', builder: (context, state) => const History()),
  GoRoute(
      path: '/profile_screen',
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: '/feedback_screen',
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: '/instructions_screen',
      builder: (context, state) => const Instructions()),
  GoRoute(
      path: '/instructions_web_screen',
      builder: (context, state) => const InstructionsWeb()),
  GoRoute(path: '/td_tm_screen', builder: (context, state) => TdTmScreen()),
  GoRoute(
      path: '/R_factor_screen',
      builder: (context, state) => const RFactorScreen()),
  // GoRoute(
  //     path: '/graph_screen', builder: (context, state) => const GraphScreen()),
];

// var routes = <String, WidgetBuilder>{
//   '/': (context) => const SplashScreen(),

//   '/signin_screen': (context) => BlocProvider(
//         create: (context) => SignInBloc(),
//         child: SignInScreen(),
//       ),

//   '/signup_screen': (context) => BlocProvider(
//         create: (context) => SignUpBloc(),
//         child: const SignUpScreen(),
//       ),

//   // '/otp_screen': (context) => OTPScreen(),

//   '/country_screen': (context) => const CountryScreen(),

//   '/registration_completed_screen': (context) =>
//       const RegistrationCompletedScreen(),

//   '/analyze_screen': (context) => const HomeScreen(),

//   '/history_screen': (context) => const History(),

//   '/profile_screen': (context) => const ProfileScreen(),

//   '/feedback_screen': (context) => const FeedbackScreen(),

//   '/instructions_screen': (context) => const Instructions(),

//   '/instructions_web_screen': (context) => const InstructionsWeb(),

//   '/td_tm_screen': (context) => TdTmScreen(),

//   '/R_factor_screen': (context) => const RFactorScreen(),

//   '/graph_screen': (context) => const GraphScreen(),
// };
