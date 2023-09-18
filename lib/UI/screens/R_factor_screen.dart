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
  final TextEditingController N = TextEditingController();
  final TextEditingController n = TextEditingController();
  final TextEditingController i = TextEditingController();
  final TextEditingController c = TextEditingController();
  final TextEditingController sui = TextEditingController();
  final TextEditingController b = TextEditingController();

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
                  height: 3.h,
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
                      child: SingleChildScrollView(
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
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: N,
                              variable: 'N',
                              dec: textFieldDecoration('Enter N'),
                              title: '(the number of exposure days per year)',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: i,
                              variable: 'i',
                              dec: textFieldDecoration('Enter i'),
                              title: '(year counter)',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: n,
                              variable: 'n',
                              dec: textFieldDecoration('Enter n'),
                              title: '(the number of years of exposure)',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: c,
                              variable: 'c',
                              dec: textFieldDecoration('Enter c'),
                              title:
                                  '(constant representing the static stress due to gravitational force)',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: b,
                              variable: 'b',
                              dec: textFieldDecoration('Enter b'),
                              title: '(age at which the exposure starts)',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyCard(
                              cont: sui,
                              variable: 'sui',
                              dec: textFieldDecoration('Enter sui'),
                              title:
                                  '(the strength of the lumbar spine for a person of age (b+i) years)',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<GetcsvCubit, GetcsvState>(
                  builder: (context, state) {
                    if (state is GetcsvLoaded) {
                      return Builder(
                        builder: (context) {
                          var temp = context.watch<DataCubitCubit>().state;

                          return Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: BlueButton(
                                text: 'Proceed',
                                onTap: () {
                                  context
                                      .read<CsVuploadCubit>()
                                      .uploadFile(state.file, {
                                    "tm": temp.tm!,
                                    "td": temp.td!,
                                    "N": N.text,
                                    "i": i.text,
                                    "n": n.text,
                                    "c": c.text,
                                    "b": b.text
                                  });
                                  Navigator.pushNamed(context, '/graph_screen');
                                }),
                          );
                        },
                      );
                    } else {
                      return const Center();
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
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteText),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteText),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String variable;
  final TextEditingController cont;
  final InputDecoration dec;
  const TextRow({
    super.key,
    required this.variable,
    required this.cont,
    required this.dec,
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
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: SizedBox(
            width: 25.w,
            height: 4.5.h,
            child: TextFormField(
              controller: cont,
              style: GoogleFonts.roboto(color: whiteText),
              cursorColor: whiteText,
              decoration: dec,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Can\'t be empty';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String variable;
  final TextEditingController cont;
  final InputDecoration dec;
  final String title;
  const MyCard({
    super.key,
    required this.cont,
    required this.dec,
    required this.variable,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: transBlack,
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRow(variable: variable, cont: cont, dec: dec),
            Text(
              title,
              style: GoogleFonts.roboto(color: whiteText, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
