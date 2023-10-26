// ignore_for_file: use_build_context_synchronously

// import 'package:data_hub/Middleware/bloc/sign_in/sign_in_bloc.dart';
// import 'package:data_hub/Middleware/bloc/sign_in/sign_in_event.dart';
import 'package:data_hub/Middleware/bloc/OTP/OTP_bloc.dart';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_bloc.dart';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_events.dart';
import 'package:data_hub/Middleware/bloc/sign_up/sign_up_states.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/screens/otp_screen.dart';
import 'package:data_hub/UI/widgets/account_button.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/blue_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // EmailOTP myauth = EmailOTP();

  // void sendOTP() async {
  //   myauth.setConfig(
  //     appEmail: "gagandeep4989@gmail.com",
  //     appName: "Data Hub",
  //     userEmail: _email.text,
  //     otpLength: 4,
  //     otpType: OTPType.digitsOnly,
  //   );
  //   if (await myauth.sendOTP() == true) {
  //     const snackBar = SnackBar(content: Text("OTP has been sent"));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     // Navigator.pushNamed(context, '/otp_screen');
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => OTPScreen(myauth: myauth),
  //       ),
  //     );
  //   } else {
  //     const snackBar = SnackBar(content: Text("OTP could not be sent"));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
                  height: 1.h,
                ),
                const MyBackButton(),
                SizedBox(
                  height: 3.h,
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
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (val) {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpNameChangedEvent(
                            nameValue: _name.text,
                          ),
                        );
                      },
                      controller: _name,
                      cursorColor: black,
                      decoration: InputDecoration(
                        hintText: 'Full name',
                        border: InputBorder.none,
                        errorText: (state is SignUpNameErrorState)
                            ? state.errorMessage
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (val) {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpEmailChangedEvent(
                            emailValue: _email.text,
                          ),
                        );
                      },
                      controller: _email,
                      cursorColor: black,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        errorText: (state is SignUpEmailErrorState)
                            ? state.errorMessage
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return TextFormField(
                      onChanged: (val) {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpPasswordChangedEvent(
                            passwordValue: _password.text,
                          ),
                        );
                      },
                      controller: _password,
                      cursorColor: black,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        errorText: (state is SignUpPasswordErrorState)
                            ? state.errorMessage
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is OTPSentState) {
                      EmailOTP au = state.myAuth;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => OTPBloc(),
                            child: OTPScreen(myauth: au),
                          ),
                        ),
                      );
                    }
                  },
                  child: BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSubmittedState) {
                        GoRouter.of(context).go('/signin_screen');
                      }
                    },
                    builder: (context, state) {
                      return BlueButton(
                        text: 'Sign Up',
                        onTap: () {
                          print("signup");
                          if (state is SignUpValidState) {
                            // sendOTP();
                            // BlocProvider.of<SignUpBloc>(context).add(
                            //   SendOTPEvent(
                            //     email: _email.text,
                            //   ),
                            // );
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpSubmittedEvent(
                                name: _name.text,
                                email: _email.text,
                                password: _password.text,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: <Widget>[
                    const Expanded(child: Divider()),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "OR",
                      style: GoogleFonts.roboto(
                        color: grey,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     AccountButton(imageUrl: 'assets/sign_in/google.png'),
                //     AccountButton(imageUrl: 'assets/sign_in/apple.png'),
                //   ],
                // ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.roboto(
                          color: darkerGrey,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/signin_screen');
                          GoRouter.of(context).go('/signin_screen');
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.roboto(
                            color: green,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
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
