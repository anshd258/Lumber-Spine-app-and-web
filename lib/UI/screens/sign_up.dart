import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

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
                  cursorColor: black,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                            .hasMatch(value)) {
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
                  cursorColor: black,
                  decoration: const InputDecoration(
                    hintText: 'Password',
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
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.roboto(
                          color: whiteText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          const snackBar =
                              SnackBar(content: Text('Submitting form'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        height: 6.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: lighterGrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.roboto(
                              color: whiteText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 6.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: lighterGrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.roboto(
                              color: whiteText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                        ),
                      ),
                      Text(
                        'Sign In',
                        style: GoogleFonts.roboto(
                          color: green,
                          fontWeight: FontWeight.w700,
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
