import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';
import 'package:data_hub/Middleware/bloc/Variabledatabloc/data_cubit_cubit.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/appbar.dart';

import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/web_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class RFactorScreen extends StatefulWidget {
  const RFactorScreen({super.key});

  @override
  State<RFactorScreen> createState() => _RFactorScreenState();
}

class _RFactorScreenState extends State<RFactorScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController N = TextEditingController();

  final TextEditingController n = TextEditingController();

  final TextEditingController i = TextEditingController();

  final TextEditingController b = TextEditingController();

  bool nInfo = false;

  bool NInfo = false;

  bool iInfo = false;

  bool bInfo = false;

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: deviceType == 'phone'
            ? const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Appbar1(title: 'Analyze'),
              )
            : const WebAppbar(),
        body: Container(
          height: 800,
          margin: EdgeInsets.only(top: deviceType == 'phone' ? 0 : 2.h),
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                deviceType == 'desktop'
                    ? Text(
                        'R Factor Parameters',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Container(),
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
                  height: deviceType == "phone" ? 72.5.h : 68.h,
                  width: deviceType == "phone" ? double.infinity : 95.sp,
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
                            SizedBox(
                              height: 2.h,
                            ),
                            deviceType == 'phone'
                                ? Container(
                                    height: 5.2.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.sp),
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
                                          'Enter Value',
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
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: deviceType == 'phone' ? 1.h : 0,
                            ),
                            Container(
                              height: deviceType == "phone"
                                  ? NInfo
                                      ? 18.3.h
                                      : 10.h
                                  : NInfo
                                      ? 23.h
                                      : 14.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: blue,
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
                                    TextRow(
                                      variable: 'N',
                                      cont: N,
                                      dec: textFieldDecoration('100'),
                                      onTap: () {
                                        setState(() {
                                          NInfo = !NInfo;
                                        });
                                      },
                                    ),
                                    NInfo
                                        ? const TextRow2(value: '30')
                                        : const Text('')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: deviceType == "phone"
                                  ? iInfo
                                      ? 18.3.h
                                      : 10.h
                                  : iInfo
                                      ? 23.h
                                      : 14.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: blue,
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
                                    TextRow(
                                      variable: 'i',
                                      cont: i,
                                      dec: textFieldDecoration('100'),
                                      onTap: () {
                                        setState(() {
                                          iInfo = !iInfo;
                                        });
                                      },
                                    ),
                                    iInfo
                                        ? const TextRow2(value: '30')
                                        : const Text('')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: deviceType == "phone"
                                  ? nInfo
                                      ? 18.3.h
                                      : 10.h
                                  : nInfo
                                      ? 23.h
                                      : 14.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: blue,
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
                                    TextRow(
                                      variable: 'n',
                                      cont: n,
                                      dec: textFieldDecoration('100'),
                                      onTap: () {
                                        setState(() {
                                          nInfo = !nInfo;
                                        });
                                      },
                                    ),
                                    nInfo
                                        ? const TextRow2(value: '30')
                                        : const Text('')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: deviceType == "phone"
                                  ? bInfo
                                      ? 18.3.h
                                      : 10.h
                                  : bInfo
                                      ? 23.h
                                      : 14.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: blue,
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
                                    TextRow(
                                      variable: 'b',
                                      cont: b,
                                      dec: textFieldDecoration('100'),
                                      onTap: () {
                                        setState(() {
                                          bInfo = !bInfo;
                                        });
                                      },
                                    ),
                                    bInfo
                                        ? const TextRow2(value: '30')
                                        : const Text('')
                                  ],
                                ),
                              ),
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
                                    "c": 0.25.toString(),
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
  final Function()? onTap;
  const TextRow({
    super.key,
    required this.variable,
    required this.cont,
    required this.dec,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Row(
      children: [
        Text(
          variable,
          style: GoogleFonts.roboto(
            color: whiteText,
            fontSize: deviceType == "phone" ? 16.sp : 14.sp,
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: SizedBox(
            width: deviceType == "phone" ? 25.w : 15.w,
            height: deviceType == "phone" ? 4.5.h : 5.h,
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
        SizedBox(width: 3.w),
        InkWell(
          onTap: onTap,
          child: Container(
            height: deviceType == "phone" ? 3.h : 5.h,
            width: 5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: whiteText),
            ),
            child: Icon(Icons.question_mark, color: whiteText, size: 17.sp),
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
      height: 8.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blue,
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
            TextRow(variable: variable, cont: cont, dec: dec, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class TextRow2 extends StatelessWidget {
  // final String variable;
  final String value;
  const TextRow2({
    super.key,
    // required this.variable,
    required this.value,
  });

  final String infoText =
      'for ex. Assume that the record of the acceleration time history is representative of the conditions to which the driver is subjected, and that the exposure lasts, on the average, a period of 30 min per workday.';

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: deviceType == "phone" ? 60.w : 58.w,
                child: Text(
                  // variable,
                  infoText,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(188, 255, 255, 255),
                    fontSize: 13.sp,
                  ),
                ),
              ),
              // const Spacer(),
              // Container(
              //   padding:
              //       EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12.sp),
              //     border: Border.all(color: Colors.white),
              //   ),
              //   child: Text(
              //     value,
              //     style: GoogleFonts.roboto(
              //       color: whiteText,
              //       fontSize: 16.sp,
              //     ),
              //   ),
              // )
            ],
          ),
          Divider(
            thickness: 2,
            color: greenGradient,
          ),
        ],
      ),
    );
  }
}
