import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  deviceType == 'phone'
                      ? const MyBackButton()
                      : const SizedBox(),
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
                      fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
                    ),
                  ),
                  Text(
                    'you\'re a tax resident in',
                    style: GoogleFonts.roboto(
                      color: darkerGrey,
                      fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const CountryDropdown(),
                  deviceType == 'phone'
                      ? const Spacer()
                      : SizedBox(height: 30.h),
                  Center(
                    child: SizedBox(
                      width: deviceType == 'phone' ? double.infinity : 30.w,
                      child: BlueButton(
                          text: 'Continue',
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, '/registration_completed_screen');
                            GoRouter.of(context)
                                .go('/registration_completed_screen');
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
