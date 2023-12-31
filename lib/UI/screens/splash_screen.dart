import 'dart:async';

import 'package:data_hub/Middleware/bloc/sign_in/sign_in_bloc.dart';
import 'package:data_hub/Middleware/bloc/sign_in/sign_in_event.dart';
import 'package:data_hub/Middleware/bloc/sign_in/sign_in_state.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigatetohome();
  }

  Future<void> _navigatetohome() async {
    // await Permission.storage.request().then((value) => print(value.name));
    // await Permission.manageExternalStorage
    //     .request()
    //     .then((value) => print(value.name));
    context.read<SignInBloc>().add(SignInAutoLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSubmittedErrorState) {
            GoRouter.of(context).go('/signin_screen');
          } else {
            GoRouter.of(context).go('/home_screen');
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 42.7.h,
                  width: 78.6.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/splash_screen/dataHub.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 75.h,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splash_screen/graph.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75.h,
              left: 60.w,
              child: Container(
                height: 3.5.h,
                width: 8.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splash_screen/grphPointer.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 72.h,
              left: 67.w,
              child: Container(
                height: 5.h,
                width: 13.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/splash_screen/564.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
