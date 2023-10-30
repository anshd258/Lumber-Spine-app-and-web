// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/web_appbar.dart';

class InstructionsWeb extends StatefulWidget {
  const InstructionsWeb({super.key});

  @override
  State<InstructionsWeb> createState() => _InstructionsWebState();
}

class _InstructionsWebState extends State<InstructionsWeb> {
  int highlightedPoint = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startHighlightAnimation();
  }

  void startHighlightAnimation() {
    const duration = Duration(seconds: 2);

    _timer = Timer.periodic(duration, (timer) {
      if (highlightedPoint == 5) {
        timer.cancel();
      } else {
        setState(() {
          highlightedPoint++;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void showUploadDialogWeb(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String deviceType = MyDevice.getDeviceType(context);
        print('***************dialog box called');
        return Dialog(
          child: SizedBox(
            width: deviceType == 'phone' ? double.infinity : 40.w,
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Start Test",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceType == 'phone' ? 18.sp : 16.sp,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_rounded,
                          size: 20.sp,
                          color: red,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "File Upload",
                    style: GoogleFonts.roboto(
                        fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CSV",
                        style: GoogleFonts.roboto(fontSize: 16.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('************ onTap called');
                          context.read<GetcsvCubit>().getWebFile();
                        },
                        child: Container(
                          height: deviceType == "phone" ? 3.5.h : 7.h,
                          width: deviceType == "phone" ? 10.w : 20.w,
                          decoration: BoxDecoration(
                            color: yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add, size: 18.sp, color: black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<GetcsvCubit, GetcsvState>(
                    builder: (context, state) {
                      if (state is GetcsvLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is GetcsvLoadedWeb) {
                        return BlueButton(
                            text: 'Proceed',
                            onTap: () {
                              // Navigator.pushNamed(context, '/td_tm_screen');
                              GoRouter.of(context).go('/td_tm_screen');
                            });
                      } else if (state is GetcsvError) {
                        return Center(
                          child: Icon(
                            Icons.error_outline_rounded,
                            color: Colors.redAccent.shade400,
                            size: 50,
                          ),
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: deviceType == 'phone'
      //     ? const PreferredSize(
      //         preferredSize: Size.fromHeight(kToolbarHeight),
      //         child: Appbar1(title: 'Instructions'),
      //       )
      //     : const WebAppbar(),
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
                      'Instructions',
                      style: GoogleFonts.roboto(
                        color: blue,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/instructions/startBar.png'),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: deviceType == "phone" ? 75.h : 70.h,
                width: deviceType == "phone" ? double.infinity : 95.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        highlightedPoint == 1
                            ? HeadingRow(
                                isActivated: true,
                                title: 'Save Data in .csv Format !',
                                no: '1')
                            : HeadingRow(
                                isActivated: false,
                                title: 'Save Data in .csv Format !',
                                no: '1'),
                        SizedBox(
                          height: 2.h,
                        ),
                        highlightedPoint == 2
                            ? HeadingRow(
                                isActivated: true,
                                title: 'Replace Header Row of .csv file',
                                no: '2')
                            : HeadingRow(
                                isActivated: false,
                                title: 'Replace Header Row of .csv file',
                                no: '2'),
                        Row(
                          children: [
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'as instructed on right',
                                  style: GoogleFonts.roboto(
                                    color: highlightedPoint == 2
                                        ? black
                                        : deactivatedBlack,
                                    fontSize:
                                        deviceType == 'phone' ? 16.sp : 14.sp,
                                  ),
                                ),
                                Text(
                                  '*USE UPPERCASE TEXT ONLY',
                                  style: GoogleFonts.roboto(
                                    color: highlightedPoint == 2
                                        ? red
                                        : deactivatedRed,
                                    fontSize:
                                        deviceType == 'phone' ? 13.sp : 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        deviceType == 'phone'
                            ? Container(
                                height: 15.h,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/instructions/csveg.png'),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 3.h,
                              ),
                        highlightedPoint == 3
                            ? HeadingRow(
                                isActivated: true,
                                title: 'Required Units',
                                no: '3')
                            : HeadingRow(
                                isActivated: false,
                                title: 'Required Units',
                                no: '3'),
                        SizedBox(height: 0.5.h),
                        Row(
                          children: [
                            highlightedPoint == 3
                                ? subTitleData(
                                    isActivated: true, title1: 'TIME (seconds)')
                                : subTitleData(
                                    isActivated: false,
                                    title1: 'TIME (seconds)'),
                            SizedBox(width: 2.w),
                            highlightedPoint == 3
                                ? subTitleData(
                                    isActivated: true, title1: 'X, Y, Z (m/s2)')
                                : subTitleData(
                                    isActivated: false,
                                    title1: 'X, Y, Z (m/s2)'),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        highlightedPoint == 4
                            ? HeadingRow(
                                isActivated: true,
                                title: 'Time Parameters',
                                no: '4')
                            : HeadingRow(
                                isActivated: false,
                                title: 'Time Parameters',
                                no: '4'),
                        highlightedPoint == 4
                            ? subTitleData(
                                isActivated: true,
                                title1: 'Td (duration of the daily exposure)',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1: 'Td (duration of the daily exposure)'),
                        highlightedPoint == 4
                            ? subTitleData(
                                isActivated: true,
                                title1:
                                    'Tm (period over which accelareration dose',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1:
                                    'Tm (period over which accelareration dose',
                              ),
                        Row(
                          children: [
                            SizedBox(width: 17.w),
                            Text(
                              '(Dk) is measured)',
                              style: GoogleFonts.roboto(
                                color: highlightedPoint == 4
                                    ? black
                                    : deactivatedBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        highlightedPoint == 5
                            ? HeadingRow(
                                isActivated: true,
                                title: 'R Factor Parameters',
                                no: '5')
                            : HeadingRow(
                                isActivated: false,
                                title: 'R Factor Parameters',
                                no: '5'),
                        highlightedPoint == 5
                            ? subTitleData(
                                isActivated: true,
                                title1:
                                    'N (the number of exposure days per year)',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1:
                                    'N (the number of exposure days per year)'),
                        highlightedPoint == 5
                            ? subTitleData(
                                isActivated: true,
                                title1: 'i (year counter)',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1: 'i (year counter)',
                              ),
                        highlightedPoint == 5
                            ? subTitleData(
                                isActivated: true,
                                title1: 'n (the number of years of exposure)',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1: 'n (the number of years of exposure)',
                              ),
                        highlightedPoint == 5
                            ? subTitleData(
                                isActivated: true,
                                title1:
                                    'b (the age at which the exposure starts)',
                              )
                            : subTitleData(
                                isActivated: false,
                                title1:
                                    'b (the age at which the exposure starts)',
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              SizedBox(
                width: deviceType == "desktop" ? 60.sp : double.infinity,
                child: BlueButton(
                  text: 'Proceed',
                  onTap: () {
                    showUploadDialogWeb(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class subTitleData extends StatelessWidget {
  final String title1;
  bool isActivated;
  subTitleData({
    Key? key,
    required this.title1,
    required this.isActivated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            Container(
              height: 1.5.h,
              width: 3.w,
              decoration: BoxDecoration(
                color: isActivated ? green : radioColor,
                shape: BoxShape.circle,
                border: Border.all(color: black),
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              title1,
              style: GoogleFonts.roboto(
                  color: isActivated ? blue : deactivatedBlack,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}

class HeadingRow extends StatelessWidget {
  final String title;
  final String no;
  bool isActivated;
  HeadingRow({
    super.key,
    required this.title,
    required this.no,
    required this.isActivated,
  });

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Row(
      children: [
        Container(
          height: 4.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: isActivated ? yellow : deactivatedYellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              no,
              style: GoogleFonts.roboto(
                  color: isActivated ? black : deactivatedBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: deviceType == 'phone' ? 16.sp : 14.sp),
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            color: blue,
            fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
