import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
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
                height: 4.h,
              ),
              Text(
                'Country of Residence',
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
                'Please select all the countries that',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'you\'re a tax resident in',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              const CountryDropdown(),
              const Spacer(),
              BlueButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.pushNamed(context, '/about_screen');
                  }),
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
