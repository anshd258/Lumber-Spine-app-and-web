import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';
import '../widgets/back_button.dart';

class RFactorScreen extends StatelessWidget {
  RFactorScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                children: [
                  const MyBackButton(),
                  SizedBox(
                    width: 26.w,
                  ),
                  Text(
                    'Analyze',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/analyze/completedBar.png'),
                )),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: black),
                ),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter R Factor',
                          style: GoogleFonts.roboto(
                            color: blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 5.2.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.sp),
                              topRight: Radius.circular(12.sp),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Variable',
                                style: GoogleFonts.roboto(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Value',
                                style: GoogleFonts.roboto(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 45.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: transBlack,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.sp),
                              bottomRight: Radius.circular(12.sp),
                            ),
                          ),
                          child: Column(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              BlueButton(text: 'Proceed', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
