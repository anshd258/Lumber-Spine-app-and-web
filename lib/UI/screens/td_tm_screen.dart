// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:data_hub/Middleware/bloc/Variabledatabloc/data_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';

import '../../Middleware/constants/colors.dart';

class TdTmScreen extends StatelessWidget {
  TdTmScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String text =
      'for ex. Assume that the record of the acceleration time history is representative of the conditions to which the driver is subjected, and that the exposure lasts, on the average, a period of 30 min per workday.';

  TextEditingController _td = TextEditingController();
  TextEditingController _tm = TextEditingController();

  void showSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/graph_screen');
                    },
                    child: const Options(
                      text1: 'Static Compression',
                      text2: 'SE',
                    ),
                  ),
                  SizedBox(height: 3.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/R_factor_screen');
                    },
                    child: const Options(
                      text1: 'Static Compression Dose',
                      text2: 'SED',
                    ),
                  ),
                  SizedBox(height: 3.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/R_factor_screen');
                    },
                    child: const Options(
                      text1: '',
                      text2: 'Both',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
                                    controller: _td,
                                    style: GoogleFonts.roboto(color: whiteText),
                                    cursorColor: whiteText,
                                    decoration: textFieldDecoration('Enter TD'),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Can\'t be empty';
                                      }
                                      return null;
                                    },
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
                                    controller: _tm,
                                    style: GoogleFonts.roboto(color: whiteText),
                                    cursorColor: whiteText,
                                    decoration: textFieldDecoration('Enter Tm'),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Can\'t be empty';
                                      }
                                      return null;
                                    },
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
                        context.read<DataCubitCubit>().getTdTm(td, tm);
                        Navigator.pushNamed(context, '/R_factor_screen');
                        // showSelectDialog(context);
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

class Options extends StatelessWidget {
  final String text1;
  final String text2;
  const Options({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      height: 6.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: Colors.transparent),
      ),
      child: text1 != ''
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: GoogleFonts.roboto(fontStyle: FontStyle.italic),
                ),
                Text(
                  text2,
                  style: GoogleFonts.roboto(color: Colors.red),
                ),
              ],
            )
          : Center(
              child: Text(
                text2,
                style: GoogleFonts.roboto(color: Colors.red),
              ),
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
