import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class RegistrationCompletedScreen extends StatelessWidget {
  const RegistrationCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  const MyBackButton(),
                  SizedBox(
                    width: 23.w,
                  ),
                  Text(
                    'Registration',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Image.asset(
                "assets/reg_complete/image.png",
                width: 300.w,
                height: 17.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Great! ',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Name',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Text(
                  'Now you can start analyzing',
                  style: GoogleFonts.roboto(
                    color: darkerGrey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'your data in real time!',
                  style: GoogleFonts.roboto(
                    color: darkerGrey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: SizedBox(
                  width: 65.w,
                  child: BlueButton(
                      text: 'Get Started',
                      onTap: () {
                        Navigator.pushNamed(context, '/home_screen');
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
