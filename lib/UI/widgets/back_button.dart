import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 4.h,
        width: 10.w,
        margin: EdgeInsets.only(left: 2.w, bottom: 0.5.h, top: 0.5.h),
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
    );
  }
}
