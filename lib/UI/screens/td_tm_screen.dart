import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class TdTmScreen extends StatelessWidget {
  TdTmScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String text =
      'for ex. Assume that the record of the acceleration time history is representative of the conditions to which the driver is subjected, and that the exposure lasts, on the average, a period of 30 min per workday.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar1(title: 'Analyze'),
        ),
        body: Container(
          height: 800,
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        mainAxisSize: MainAxisSize.min,
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
                              mainAxisSize: MainAxisSize.min,
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
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextRow(variable: 'TD', value: '100'),
                                  SizedBox(height: 1.h),
                                  Text(
                                    'is the duration of the daily exposure',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          188, 255, 255, 255),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  TextRow2(variable: text, value: '30'),
                                  TextFormField(
                                    style: GoogleFonts.roboto(color: whiteText),
                                    cursorColor: whiteText,
                                    decoration: textFieldDecoration('Enter TD'),
                                  ),
                                  SizedBox(height: 3.h),
                                  const TextRow(variable: 'Tm', value: '100'),
                                  Text(
                                    'is the duration of the daily exposure',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          188, 255, 255, 255),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  TextRow2(variable: text, value: '30'),
                                  TextFormField(
                                    style: GoogleFonts.roboto(color: whiteText),
                                    cursorColor: whiteText,
                                    decoration: textFieldDecoration('Enter Tm'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: BlueButton(
                      text: 'Proceed',
                      onTap: () {
                        Navigator.pushNamed(context, '/R_factor_screen');
                      }),
                )
              ],
            ),
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(color: Colors.white),
          ),
          child: Text(
            value,
            style: GoogleFonts.roboto(
              color: whiteText,
              fontSize: 16.sp,
            ),
          ),
        )
      ],
    );
  }
}

class TextRow2 extends StatelessWidget {
  final String variable;
  final String value;
  const TextRow2({
    super.key,
    required this.variable,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60.w,
          child: Text(
            variable,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(188, 255, 255, 255),
              fontSize: 13.sp,
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(color: Colors.white),
          ),
          child: Text(
            value,
            style: GoogleFonts.roboto(
              color: whiteText,
              fontSize: 16.sp,
            ),
          ),
        )
      ],
    );
  }
}
