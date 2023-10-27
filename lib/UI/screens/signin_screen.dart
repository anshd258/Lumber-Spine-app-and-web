import 'package:data_hub/Middleware/bloc/sign_in/sign_in_bloc.dart';
import 'package:data_hub/Middleware/bloc/sign_in/sign_in_event.dart';
import 'package:data_hub/Middleware/bloc/sign_in/sign_in_state.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';
import '../widgets/blue_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     // context.read<SignInBloc>().add(SignInAutoLogin());
    //   },
    // );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    Text(
                      'Create a',
                      style: GoogleFonts.roboto(
                        color: blue,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Data Hub',
                      style: GoogleFonts.roboto(
                        color: green,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  'account',
                  style: GoogleFonts.roboto(
                    color: blue,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  return TextFormField(
                    onChanged: (val) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInEmailChangedEvent(
                          emailValue: _email.text,
                        ),
                      );
                    },
                    controller: _email,
                    cursorColor: black,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      errorText: (state is SignInEmailErrorState)
                          ? state.errorMessage
                          : null,
                    ),
                  );
                }),
                SizedBox(
                  height: 2.5.h,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    //Specifying UI based on events
                    return TextFormField(
                      //Firing Event
                      onChanged: (val) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInPasswordChangedEvent(
                            passwordValue: _password.text,
                          ),
                        );
                      },
                      controller: _password,
                      cursorColor: black,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        errorText: (state is SignInPasswordErrorState)
                            ? state.errorMessage
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: deviceType == 'phone' ? 3.h : 35.h,
                ),
                BlocListener<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSubmittedState) {
                      // Navigator.pushNamed(context, '/analyze_screen');
                      GoRouter.of(context).go('/home_screen');
                    }
                  },
                  child: BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return Center(
                        child: SizedBox(
                          width: deviceType == 'phone' ? double.infinity : 30.w,
                          child: BlueButton(
                              text: 'Sign In',
                              onTap: () {
                                if (state is SignInValidState) {
                                  BlocProvider.of<SignInBloc>(context).add(
                                    SignInSubmittedEvent(
                                      email: _email.text,
                                      password: _password.text,
                                    ),
                                  );
                                }
                              }),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.roboto(
                          color: darkerGrey,
                          fontSize: deviceType == 'phone' ? 16.sp : 12.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/signup_screen');
                          GoRouter.of(context).go('/signup_screen');
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.roboto(
                            color: green,
                            fontWeight: FontWeight.w700,
                            fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
