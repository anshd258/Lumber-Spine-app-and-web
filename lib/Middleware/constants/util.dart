import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

var appBar2 = AppBar(
    leading: const MyBackButton(),
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'Analyze',
      style: GoogleFonts.roboto(
        color: blue,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    ));
