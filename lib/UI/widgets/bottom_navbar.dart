import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(198, 232, 232, 232),
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.solidEnvelopeOpen,
                size: 20.sp,
                color: blue,
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                'Home',
                style: GoogleFonts.roboto(
                  color: blue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 241, 90, 64),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                Icons.person_outline,
                size: 20.sp,
                color: darkerGrey,
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                'Profile',
                style: GoogleFonts.roboto(
                  color: darkerGrey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
