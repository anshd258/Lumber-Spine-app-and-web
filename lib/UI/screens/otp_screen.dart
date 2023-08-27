import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class OTPScreen extends StatefulWidget {
  EmailOTP myauth;
  OTPScreen({super.key, required this.myauth});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var verNumber = '';
  TextEditingController pinCodeController = TextEditingController();

  void verifyOTP() async {
    if (await widget.myauth.verifyOTP(otp: pinCodeController.text) == true) {
      const snackBar = SnackBar(
        content: Text("OTP is verified"),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        content: Text("Invalid OTP"),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 15.5.w,
      height: 7.h,
      textStyle: GoogleFonts.roboto(
        color: blue,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: blue),
        borderRadius: BorderRadius.circular(12.sp),
        color: whiteText,
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 5.h,
                  width: 11.1.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: lighterGrey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Verify it\'s you',
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                'We sent a code to',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'Enter it here to verify your identity',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                autofocus: true,
                showCursor: true,
                obscureText: false,
                keyboardType: TextInputType.number,
                onCompleted: (value) {
                  verNumber = value;
                },
                defaultPinTheme: defaultPinTheme,
                enabled: true,
                controller: pinCodeController,
                onChanged: (value) => {
                  verNumber = value,
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.roboto(
                      color: green,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              BlueButton(
                  text: 'Confirm',
                  onTap: () {
                    verifyOTP();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
