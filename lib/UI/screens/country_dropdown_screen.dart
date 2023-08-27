import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class CountryDropdownScreen extends StatelessWidget {
  const CountryDropdownScreen({super.key});

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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
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
              ),
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
              BlueButton(text: 'Continue', onTap: () {}),
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
