import 'package:data_hub/UI/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeSed extends StatelessWidget {
  const GaugeSed({
    super.key,
    required this.deviceType,
    required this.sed,
  });

  final String deviceType;
  final double sed;

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
              endValue: sed,
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