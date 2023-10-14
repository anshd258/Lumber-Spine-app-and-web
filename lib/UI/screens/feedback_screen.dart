import 'dart:convert';

import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/web_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    TextEditingController ctr = TextEditingController();
    return Scaffold(
      appBar: deviceType == 'phone'
          ? const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Appbar1(title: 'Feedback'),
            )
          : const WebAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 9.h,
              ),
              Center(
                child: Container(
                  height: deviceType == 'phone' ? 100.h : 70.h,
                  width: deviceType == 'phone' ? double.infinity : 50.w,
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
                          fontSize: deviceType == 'phone' ? 22.sp : 19.sp,
                        ),
                      ),
                      Text(
                        'Review for us?',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontWeight: FontWeight.w600,
                          fontSize: deviceType == 'phone' ? 22.sp : 19.sp,
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
                      SizedBox(
                        width: deviceType == 'phone' ? double.infinity : 40.w,
                        child: Container(
                          width: 80.w,
                          height: 8.h,
                          padding: EdgeInsets.all(7.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: ctr,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                hintText: 'we have a solution',
                                hintStyle:
                                    GoogleFonts.roboto(color: darkerGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: deviceType == 'phone' ? 3.h : 10.h,
                      ),
                      SizedBox(
                        width: deviceType == 'phone' ? 20.w : 15.w,
                        child: BlueButton(
                            text: 'Send',
                            onTap: () async {
                              await http
                                  .post(
                                      Uri.parse(
                                          "https://api.emailjs.com/api/v1.0/email/send"),
                                      headers: {
                                        'Content-Type': 'application/json',
                                      },
                                      body: json.encode({
                                        'accessToken': '19cmI_x2zOfbpO_qdonwj',
                                        'service_id': 'service_h96l2r6',
                                        'template_id': 'template_vi7yg1t',
                                        'user_id': 'KHTOTaPcLZLaIWFDm',
                                        'template_params': {
                                          'user_name': 'anshdeep',
                                          'user_email': 'useremail@gmail.com',
                                          'user_message': ctr.text
                                        }
                                      }))
                                  .then((value) {
                                print(value.body);
                                ctr.clear();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
