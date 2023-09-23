import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar1(title: 'Analyze'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                MyCard(
                  title: 'Lumber Spline Measurement',
                  desc: desc,
                  onTap: () {},
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/instructions_screen');
                  },
                  child: Container(
                    padding: EdgeInsets.all(18.sp),
                    height: 35.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteText,
                      border: Border.all(color: blue, width: 10.sp),
                    ),
                    child: Container(
                      height: 25.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blue,
                      ),
                      child: Center(
                        child: Text(
                          'Start Test',
                          style: GoogleFonts.roboto(
                            color: whiteText,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlueButton(
                    text: 'History',
                    onTap: () {
                      Navigator.pushNamed(context, '/history_screen');
                    }),
                SizedBox(
                  height: 6.h,
                ),
                const BottomNavBar(),
              ],
            ),
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
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sed: Daily Equivalent Static Compression Dose (Mpa)',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'R: Risk Factor',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
