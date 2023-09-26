// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: SizedBox(
                  height: 8.h,
                  child: const Image(
                    image: AssetImage('assets/analyze/profile.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Personal Info',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const PersonalInfo(field: 'Your name', val: 'Tommy Jason'),
              SizedBox(height: 3.h),
              const PersonalInfo(field: 'Occupation', val: 'Manager'),
              SizedBox(height: 3.h),
              const PersonalInfo(field: 'Employer', val: 'Overlay Design'),
              SizedBox(height: 4.h),
              Text(
                'Contact Info',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const PersonalInfo(
                  field: 'Phone number', val: '(1) 3256 8456 888'),
              SizedBox(height: 3.h),
              const PersonalInfo(field: 'Email', val: 'tommyjason@mail.com'),
              SizedBox(height: 10.h),
              Center(
                child: SizedBox(
                  width: 70.w,
                  child: BlueButton(
                      text: 'Any feedback for Us?',
                      onTap: () {
                        Navigator.pushNamed(context, '/feedback_screen');
                      }),
                ),
              ),
              SizedBox(height: 4.h),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Edit',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
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

class PersonalInfo extends StatelessWidget {
  final String field;
  final String val;
  const PersonalInfo({
    Key? key,
    required this.field,
    required this.val,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          field,
          style: GoogleFonts.roboto(
            color: darkerGrey,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        const Spacer(),
        Text(
          val,
          style: GoogleFonts.roboto(
            color: blue,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
