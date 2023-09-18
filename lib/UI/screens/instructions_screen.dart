import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 2.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/analyze/halfCompBar.png'),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 75.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const HeadingRow(title: 'CSV File'),
                      Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/instructions/csveg.png'),
                          ),
                        ),
                      ),
                      const HeadingRow(title: 'Data needed'),
                      SizedBox(
                        height: 2.h,
                      ),
                      const dataNeeded(title1: 'Time , ', title2: 'ex. Time'),
                      const dataNeeded(
                          title1: 'X axis , ', title2: 'ex. Seatpad-X'),
                      const dataNeeded(
                          title1: 'Y axis , ', title2: 'ex. Seatpad-Y'),
                      const dataNeeded(
                          title1: 'Z axis , ', title2: 'ex. Seatpad-Z'),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage('assets/instructions/img1.png'),
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage('assets/instructions/img2.png'),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              BlueButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(context, '/checklist_screen');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class dataNeeded extends StatelessWidget {
  final String title1;
  final String title2;
  const dataNeeded({
    super.key,
    required this.title1,
    required this.title2,
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
              style: GoogleFonts.roboto(color: blue, fontSize: 15),
            ),
            Text(
              title2,
              style: GoogleFonts.roboto(color: darkerGrey, fontSize: 15),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 15.w,
            ),
            Text(
              '*This will be the the time column in your data file.',
              style: GoogleFonts.roboto(
                color: darkerGrey,
                fontSize: 11,
              ),
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
  const HeadingRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              height: 2.h,
              width: 5.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/analyze/checklistIc.png'),
                  fit: BoxFit.contain,
                ),
              ),
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
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
