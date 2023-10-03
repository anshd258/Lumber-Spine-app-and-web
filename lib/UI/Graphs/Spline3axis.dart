import 'package:data_hub/Models/graphmodals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

///Core import
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///Core theme import
import 'package:syncfusion_flutter_core/theme.dart';

///Slider import
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ThreeAxisGraph extends StatefulWidget {
  ThreeAxisGraph({
    super.key,
    required this.data,
  });
  final ResponseGraphModal data;

  @override
  State<ThreeAxisGraph> createState() => _ThreeAxisGraphState();
}

class _ThreeAxisGraphState extends State<ThreeAxisGraph> {
  late ZoomPanBehavior zoomer;
  late RangeController ctr;

  @override
  void initState() {
    // var meu = zpeak;
    // meu.sort();
    // print("${meu.first} - ${meu.last}");
    ctr = RangeController(
        start: double.parse(widget.data.data!.rawTimeZ!.first),
        end: double.parse(widget.data.data!.rawTimeZ!.last));
    zoomer = ZoomPanBehavior(
        enablePanning: true,
        enableDoubleTapZooming: true,
        enableSelectionZooming: true,
        enablePinching: true,
        zoomMode: ZoomMode.xy);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
          margin: EdgeInsets.all(1.w),
          plotAreaBackgroundColor: Colors.black,
          legend: Legend(
              position: LegendPosition.top,
              alignment: ChartAlignment.center,
              overflowMode: LegendItemOverflowMode.scroll,
              isResponsive: true,
              isVisible: true,
              itemPadding: 3,
              textStyle: GoogleFonts.lato(fontSize: 10),
              padding: 1,
              iconWidth: 10,
              iconHeight: 10),
          title: ChartTitle(text: "All Graph"),
          primaryYAxis: NumericAxis(
            maximum: widget.data.data!.rawMaxPos!,
            isVisible: true,
            title: AxisTitle(
              text: "Acceleration (m/s\u00B2)",
              textStyle: GoogleFonts.roboto(fontSize: 10),
            ),
            minimum: widget.data.data!.rawMaxNeg!,
            labelStyle: GoogleFonts.roboto(fontSize: 8),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          primaryXAxis: NumericAxis(
            rangeController: ctr,
            minimum: ctr.start,
            maximum: ctr.end,
            labelStyle: GoogleFonts.roboto(fontSize: 8),
            visibleMaximum: ctr.end,
            visibleMinimum: ctr.start,
            isVisible: true,
            title: AxisTitle(
              text: "Time (s)",
              textStyle: GoogleFonts.roboto(fontSize: 15),
            ),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          zoomPanBehavior: zoomer,
          trackballBehavior: TrackballBehavior(
            enable: true,
            markerSettings: const TrackballMarkerSettings(
              markerVisibility: TrackballVisibilityMode.visible,
              height: 10,
              width: 10,
              borderWidth: 1,
            ),
          ),
          series: <SplineSeries>[
            SplineSeries<double, double>(
              legendItemText: "X",
              color: Colors.blueAccent.shade400.withOpacity(0.8),
              splineType: SplineType.monotonic,
              opacity: 0.8,
              enableTooltip: true,
              dataSource: widget.data.data!.rawPeakX!,
              xValueMapper: (double datum, index) =>
                  double.parse(widget.data.data!.rawTimeX![index]),
              yValueMapper: (double datum, index) => datum,
            ),
            SplineSeries<double, double>(
              legendItemText: "Y",
              color: Colors.greenAccent.shade400.withOpacity(0.5),
              splineType: SplineType.monotonic,
              opacity: 0.8,
              enableTooltip: true,
              dataSource: widget.data.data!.rawPeakY!,
              xValueMapper: (double datum, index) =>
                  double.parse(widget.data.data!.rawTimeY![index]),
              yValueMapper: (double datum, index) => datum,
            ),
            SplineSeries<double, double>(
              legendItemText: "Z",
              color: Colors.redAccent.shade400.withOpacity(0.8),
              splineType: SplineType.monotonic,
              opacity: 0.8,
              enableTooltip: true,
              dataSource: widget.data.data!.rawPeakZ!,
              xValueMapper: (double datum, index) =>
                  double.parse(widget.data.data!.rawTimeZ![index]),
              yValueMapper: (double datum, index) => datum,
            ),
          ],
        ),
        SfRangeSelectorTheme(
          data: SfRangeSelectorThemeData(
              activeLabelStyle:
                  const TextStyle(fontSize: 10, color: Colors.black),
              inactiveLabelStyle:
                  const TextStyle(fontSize: 10, color: Colors.black),
              activeTrackColor: const Color.fromRGBO(255, 125, 30, 1),
              inactiveRegionColor: Colors.white.withOpacity(0.75),
              thumbColor: Colors.white,
              thumbStrokeColor: const Color.fromRGBO(255, 125, 30, 1),
              thumbStrokeWidth: 2.0,
              overlayRadius: 1,
              activeRegionColor: Colors.amber.withOpacity(0.4),
              overlayColor: Colors.transparent),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: SfRangeSelector(
              min: ctr.start,
              max: ctr.end,
              enableDeferredUpdate: false,
              deferredUpdateDelay: 1000,
              interval: ctr.end / 5,
              showTicks: false,
              showLabels: true,
              dragMode: SliderDragMode.both,
              controller: ctr,
              child: Container(
                height: 75,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
              ),
            ),
          ),
        )
      ],
    );
  }
}
