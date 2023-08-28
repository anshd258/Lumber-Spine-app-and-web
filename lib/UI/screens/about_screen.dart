import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';
import '../widgets/back_button.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

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
              const MyBackButton(),
              SizedBox(
                height: 1.h,
              ),
              Image.asset(
                "assets/about_page/bar.png",
                width: 42.sp,
                height: 24.sp,
              ),
              SizedBox(
                height: 2.h,
              ),
              Image.asset(
                "assets/about_page/profile.png",
                width: 40.sp,
                height: 37.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'About me',
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'Start by adding your name. Please tell us the',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'name of your Official ID',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: GoogleFonts.roboto(fontSize: 14.sp),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: GoogleFonts.roboto(fontSize: 14.sp),
                  border: InputBorder.none,
                ),
              ),
              const Spacer(),
              BlueButton(text: 'Proceed', onTap: () {}),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
