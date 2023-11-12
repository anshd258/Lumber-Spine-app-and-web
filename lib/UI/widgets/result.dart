import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/widgets/progress1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import './progress2.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

    _animation2 = Tween<double>(begin: 0, end: r).animate(_animationController2)
      ..addListener(() {
        setState(() {});
      });

    _animationController2.forward();
  }

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Factor SeD',
          style: GoogleFonts.roboto(
              fontSize: deviceType == 'phone' ? 22.sp : 18.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Adverse health effects',
          style: GoogleFonts.roboto(
              fontSize: deviceType == 'phone' ? 17.sp : 14.sp,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: SizedBox(
            width: deviceType == 'phone' ? double.infinity : 80.w,
            child: SfLinearGauge(
              minimum: 0,
              maximum: 1,
              ranges: [
                LinearGaugeRange(
                  startValue: 0,
                  endValue: widget.sed,
                )
              ],
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 5,
                color: Colors.grey,
              ),
              interval: 0.5,
            ),
          ),
        ),
        // Center(
        //   child: CustomPaint(
        //     foregroundPainter: CircleProgress1(_animation1.value),
        //     child: SizedBox(
        //       width: 300,
        //       height: 300,
        //       child: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               '${widget.sed.toStringAsFixed(5)}',
        //               style: GoogleFonts.roboto(
        //                   fontSize: 20.sp, fontWeight: FontWeight.w300),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: Container(
            height: deviceType == 'phone' ? 4.h : 4.h,
            width: deviceType == 'phone' ? double.infinity : 50.w,
            decoration: BoxDecoration(
              color: greenGradient,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: sed < 0.8
                  ? Text(
                      "Low probability of adverse health effect !",
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: whiteText,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Text(
                      "High probability of adverse health effect !",
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: whiteText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          'Factor R',
          style: GoogleFonts.roboto(
              fontSize: deviceType == 'phone' ? 22.sp : 18.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Adverse health effects',
          style: GoogleFonts.roboto(
              fontSize: deviceType == 'phone' ? 17.sp : 14.sp,
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: SizedBox(
            width: deviceType == 'phone' ? double.infinity : 80.w,
            child: SfLinearGauge(
              minimum: 0,
              maximum: 1,
              ranges: [
                LinearGaugeRange(
                  startValue: 0,
                  endValue: widget.r,
                )
              ],
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 5,
                color: Colors.grey,
              ),
              interval: 0.5,
            ),
          ),
        ),
        // Center(
        //   child: CustomPaint(
        //     foregroundPainter: CircleProgress2(widget.r),
        //     child: SizedBox(
        //       width: 300,
        //       height: 300,
        //       child: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               _animation2.value.toStringAsFixed(5),
        //               style: GoogleFonts.roboto(
        //                   fontSize: 20.sp, fontWeight: FontWeight.w300),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: Container(
            height: deviceType == 'phone' ? 4.h : 4.h,
            width: deviceType == 'phone' ? double.infinity : 50.w,
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
                child: r > 1.2
                    ? Text(
                        "High probability of adverse health effect !",
                        style: GoogleFonts.roboto(
                          fontSize: 10.sp,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        "Low probability of adverse health effect !",
                        style: GoogleFonts.roboto(
                          fontSize: 10.sp,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
          ),
        ),
      ],
    );
  }
}
