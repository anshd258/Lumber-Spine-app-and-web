import 'dart:html';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/web_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';

class InstructionsWeb extends StatelessWidget {
  const InstructionsWeb({super.key});

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
                          final input = InputElement()
                            ..type = 'file'
                            ..accept = '.csv';
                          input.onChange.listen((event) {
                            final files = input.files;
                            if (files!.isNotEmpty) {
                              final file = files[0];
                              final reader = FileReader();
                              reader.onLoad.listen((e) {
                                final result = reader.result;
                                if (result is List<int>) {
                                  context
                                      .read<GetcsvCubit>()
                                      .getWebFile(result);
                                }
                              });
                              reader.readAsArrayBuffer(file);
                            }
                          });
                          input.click();
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
                              Navigator.pushNamed(context, '/td_tm_screen');
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
      appBar: deviceType == 'phone'
          ? const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Appbar1(title: 'Instructions'),
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
                        const HeadingRow(
                            title: 'Save Data in .csv Format !', no: '1'),
                        SizedBox(
                          height: 2.h,
                        ),
                        const HeadingRow(
                            title: 'Replace Header Row of .csv file', no: '2'),
                        Row(
                          children: [
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'as instructed below',
                                  style: GoogleFonts.roboto(
                                    color: blue,
                                    fontSize:
                                        deviceType == 'phone' ? 16.sp : 14.sp,
                                  ),
                                ),
                                Text(
                                  '*USE UPPERCASE TEXT ONLY',
                                  style: GoogleFonts.roboto(
                                    color: red,
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
                        Row(
                          children: [
                            SizedBox(width: 12.w),
                            Text(
                              'Required Units',
                              style: GoogleFonts.roboto(
                                color: blue,
                                fontWeight: FontWeight.bold,
                                fontSize: deviceType == 'phone' ? 16.sp : 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        Row(
                          children: [
                            const dataNeeded(title1: 'TIME (seconds)'),
                            SizedBox(width: 2.w),
                            const dataNeeded(title1: 'X, Y, Z (m/s2)'),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        const HeadingRow(title: 'Time Parameters', no: '3'),
                        const dataNeeded(
                          title1: 'Td (duration of the daily exposure)',
                        ),
                        const dataNeeded(
                          title1: 'Tm (period over which accelareration dose',
                        ),
                        Row(
                          children: [
                            SizedBox(width: 17.w),
                            Text(
                              '(Dk) is measured)',
                              style: GoogleFonts.roboto(
                                  color: blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        const HeadingRow(title: 'R Factor Parameters', no: '4'),
                        const dataNeeded(
                          title1: 'N (the number of exposure days per year)',
                        ),
                        const dataNeeded(
                          title1: 'i (year counter)',
                        ),
                        const dataNeeded(
                          title1: 'n (the number of years of exposure)',
                        ),
                        const dataNeeded(
                          title1: 'b (the age at which the exposure starts)',
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

class dataNeeded extends StatelessWidget {
  final String title1;
  const dataNeeded({
    super.key,
    required this.title1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            Container(
              height: 2.h,
              width: 5.w,
              decoration: BoxDecoration(
                color: yellow,
                shape: BoxShape.circle,
                border: Border.all(color: blue),
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              title1,
              style: GoogleFonts.roboto(
                  color: blue, fontSize: 12.sp, fontWeight: FontWeight.w500),
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
  const HeadingRow({
    super.key,
    required this.title,
    required this.no,
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
            color: yellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              no,
              style: GoogleFonts.roboto(
                  color: blue,
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
