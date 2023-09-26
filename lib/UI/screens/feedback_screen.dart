import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar1(title: 'Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 9.h,
              ),
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: black),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      'Do you have',
                      style: GoogleFonts.roboto(
                        color: blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                    Text(
                      'Review for us?',
                      style: GoogleFonts.roboto(
                        color: blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Write the message you want us to help you !',
                      style: GoogleFonts.roboto(
                        color: darkerGrey,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 80.w,
                      height: 8.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            blue,
                            yellow,
                          ],
                        ),
                      ),
                      child: Container(
                        width: 78.w,
                        height: 7.h,
                        color: whiteText,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'we have a solution',
                              hintStyle: GoogleFonts.roboto(color: darkerGrey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 20.w,
                      child: BlueButton(text: 'Send', onTap: () {}),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
