import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class AnalyzeScreen extends StatefulWidget {
  const AnalyzeScreen({super.key});

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  final String desc =
      'the person subjected to the vibration is seated in an upright position and does not voluntarily rise from the seat during the exposure. Different postures can result in different responses in the spine.';

  String finalFilePath = '';

  void showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
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
                        fontSize: 18.sp,
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
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CSV",
                      style: GoogleFonts.roboto(fontSize: 16.sp),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<GetcsvCubit>().getFile();
                      },
                      child: Container(
                        height: 3.5.h,
                        width: 10.w,
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
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is GetcsvLoaded) {
                      return BlueButton(
                          text: 'Proceed',
                          onTap: () {
                            Navigator.pushNamed(context, '/checklist_screen');
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
                      return Center();
                    }
                  },
                )
              ],
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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar1(title: 'Analyze'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              MyCard(
                title: 'Lumber Spline Measurement',
                desc: desc,
                onTap: () {
                  showUploadDialog(context);
                },
              ),
              MyCard(
                title: 'Calculated parameters in HBV module',
                desc: desc,
                onTap: () {
                  showUploadDialog(context);
                },
              ),
              Text(
                '+ More Coming Soon',
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String desc;
  final Function onTap;
  const MyCard({
    super.key,
    required this.title,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          height: 16.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: whiteText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 3.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/home_page/w.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                desc,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 6.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.sp),
              bottomRight: Radius.circular(15.sp),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 224, 223, 223).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => onTap(),
                child: Container(
                  margin: EdgeInsets.all(12.sp),
                  height: 3.5.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Center(
                    child: Text(
                      'START TEST',
                      style: GoogleFonts.roboto(
                        color: whiteText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
