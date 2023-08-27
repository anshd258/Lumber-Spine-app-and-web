import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class AccountButton extends StatelessWidget {
  String imageUrl;
  AccountButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 6.h,
        width: 43.w,
        decoration: BoxDecoration(
          border: Border.all(color: lighterGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Container(
            height: 3.h,
            width: 6.5.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
