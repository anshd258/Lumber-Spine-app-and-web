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
        resizeToAvoidBottomInset: false,
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
                height: 3.h,
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
                height: 2.h,
              ),
              Container(
                height: 72.5.h,
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
                          height: 59.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: transBlack,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.sp),
                              bottomRight: Radius.circular(12.sp),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Column(
                              children: [
                                const TextRow(variable: 'N', value: '100'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration: textFieldDecoration(
                                      '(the number of exposure days per year)'),
                                ),
                                SizedBox(height: 1.h),
                                const TextRow(variable: 'i', value: '3'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration:
                                      textFieldDecoration('(year counter)'),
                                ),
                                SizedBox(height: 1.h),
                                const TextRow(variable: 'n', value: '100'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration: textFieldDecoration(
                                      '(the number of years of exposure)'),
                                ),
                                SizedBox(height: 1.h),
                                const TextRow(variable: 'C', value: '100'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration: textFieldDecoration(
                                      '(constant representing the static stress due to gravitational force)'),
                                ),
                                SizedBox(height: 1.h),
                                const TextRow(variable: 'Sui', value: '3'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration: textFieldDecoration(
                                      '(the strength of the lumbar spine for a person of age (b+i) years)'),
                                ),
                                SizedBox(height: 1.h),
                                const TextRow(variable: 'b', value: '3'),
                                TextFormField(
                                  style: GoogleFonts.roboto(color: whiteText),
                                  cursorColor: whiteText,
                                  decoration: textFieldDecoration(
                                      '(age at which the exposure starts)'),
                                ),
                              ],
                            ),
                          ),
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

  InputDecoration textFieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.roboto(
          fontSize: 13.sp, color: const Color.fromARGB(170, 255, 255, 255)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: whiteText),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: whiteText),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String variable;
  final String value;
  const TextRow({
    super.key,
    required this.variable,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          variable,
          style: GoogleFonts.roboto(
            color: whiteText,
            fontSize: 16.sp,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.roboto(
            color: whiteText,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
