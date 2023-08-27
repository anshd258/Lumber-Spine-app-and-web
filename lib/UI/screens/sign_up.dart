// ignore_for_file: use_build_context_synchronously

import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/screens/otp_screen.dart';
import 'package:data_hub/UI/widgets/account_button.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/blue_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  EmailOTP myauth = EmailOTP();

  void sendOTP() async {
    myauth.setConfig(
      appEmail: "gagandeep4989@gmail.com",
      appName: "Data Hub",
      userEmail: _email.text,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );
    if (await myauth.sendOTP() == true) {
      const snackBar = SnackBar(content: Text("OTP has been sent"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pushNamed(context, '/otp_screen');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OTPScreen(myauth: myauth),
        ),
      );
    } else {
      const snackBar = SnackBar(content: Text("OTP could not be sent"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      sendOTP();
    }
  }

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
                Container(
                  height: 5.h,
                  width: 11.1.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: lighterGrey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: black,
                    ),
                  ),
                ),
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
                TextFormField(
                  controller: _name,
                  cursorColor: black,
                  decoration: const InputDecoration(
                    hintText: 'Full name',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                TextFormField(
                  controller: _email,
                  cursorColor: black,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                            .hasMatch(value)) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                TextFormField(
                  controller: _password,
                  cursorColor: black,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlueButton(
                    text: 'Sign Up',
                    onTap: () {
                      signUp();
                    }),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AccountButton(imageUrl: 'assets/sign_in/google.png'),
                    AccountButton(imageUrl: 'assets/sign_in/apple.png'),
                  ],
                ),
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
                      Text(
                        'Sign In',
                        style: GoogleFonts.roboto(
                          color: green,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
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
