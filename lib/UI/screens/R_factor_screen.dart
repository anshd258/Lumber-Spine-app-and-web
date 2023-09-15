import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';
import 'package:data_hub/Middleware/bloc/Variabledatabloc/data_cubit_cubit.dart';
import 'package:data_hub/UI/widgets/appbar.dart';

import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class RFactorScreen extends StatelessWidget {
  RFactorScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                Builder(
                  builder: (context) {
                    var state = context.watch<CsVuploadCubit>().state;
                    var temp = context.watch<DataCubitCubit>().state;
                    if (state is GetcsvLoaded && temp is DataCubitupdated) {
                      var value = state as GetcsvLoaded;
                      return Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: BlueButton(
                            text: 'Proceed',
                            onTap: () {
                              context
                                  .read<CsVuploadCubit>()
                                  .uploadFile(value.file, {
                                "tm": temp.tm!,
                                "td": temp.td!,
                                "N": ,
                                "i": ,
                                "n": ,
                                "c": ,
                                "b": 
                              });
                              Navigator.pushNamed(context, '/graph_screen');
                            }),
                      );
                    } else {
                      return Center();
                    }
                  },
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
