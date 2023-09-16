import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/progress1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './progress2.dart';

class Result extends StatefulWidget {
  final double r;
  final double sed;
  const Result({Key? key, required this.r, required this.sed});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation<double> _animation1;
  late AnimationController _animationController2;
  late Animation<double> _animation2;
  late final sed;
  late final r;

  @override
  void initState() {
    super.initState();
    sed = widget.sed;
    r = widget.r;
    _animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animation1 =
        Tween<double>(begin: 0, end: sed).animate(_animationController1)
          ..addListener(() {
            setState(() {});
          });

    _animationController1.forward();

    //---

    _animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animation2 =
        Tween<double>(begin: 0, end: sed).animate(_animationController2)
          ..addListener(() {
            setState(() {});
          });

    _animationController2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Factor SeD',
          style:
              GoogleFonts.roboto(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          'Adverse health effects',
          style:
              GoogleFonts.roboto(fontSize: 17.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: CustomPaint(
            foregroundPainter: CircleProgress1(_animation1.value),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_animation1.value}',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'below',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 4.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: greenGradient,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Center(
            child: Text(
              "Low probability of adverse health effect !",
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: whiteText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          'Factor R',
          style:
              GoogleFonts.roboto(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          'Adverse health effects',
          style:
              GoogleFonts.roboto(fontSize: 17.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: CustomPaint(
            foregroundPainter: CircleProgress2(_animation2.value),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_animation2.value}',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'above',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 4.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Center(
            child: Text(
              "High probability of adverse health effect !",
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
