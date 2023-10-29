import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeR extends StatelessWidget {
  const GaugeR({
    super.key,
    required this.deviceType,
    required this.r,
  });

  final String deviceType;
  final double r;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: deviceType == 'phone' ? double.infinity : 80.w,
        child: SfLinearGauge(
          minimum: 0,
          maximum: 1,
          ranges: [
            LinearGaugeRange(
              startValue: 0,
              endValue: r,
            )
          ],
          axisTrackStyle: const LinearAxisTrackStyle(
            thickness: 5,
            color: Colors.grey,
          ),
          interval: 0.5,
        ),
      ),
    );
  }
}
