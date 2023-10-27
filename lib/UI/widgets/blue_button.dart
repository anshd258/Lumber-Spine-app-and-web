import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const BlueButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 6.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: whiteText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
