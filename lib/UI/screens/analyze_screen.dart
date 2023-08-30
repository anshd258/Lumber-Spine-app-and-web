import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class AnalyzeScreen extends StatelessWidget {
  AnalyzeScreen({super.key});

  String desc =
      'the person subjected to the vibration is seated in an upright position and does not voluntarily rise from the seat during the exposure. Different postures can result in different responses in the spine.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  const MyBackButton(),
                  SizedBox(
                    width: 23.w,
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
              MyCard(
                title: 'Lumber Spline Measurement',
                desc: desc,
                onTap: () {},
              ),
              MyCard(
                title: 'Calculated parameters in HBV module',
                desc: desc,
                onTap: () {},
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
