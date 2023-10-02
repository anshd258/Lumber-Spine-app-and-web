import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Core import
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///Core theme import
import 'package:syncfusion_flutter_core/theme.dart';

///Slider import
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LineChartexp extends StatefulWidget {
  LineChartexp(
      {super.key,
      required this.data,
      required this.xtitle,
      required this.ytitle,
      required this.time,
      required this.gradientColor,
      required this.isShowingMainData,
      required this.max,
      required this.min});
  final List<double> data;
  final List<String> time;
  final double max;
  final String xtitle;
  final String ytitle;
  final double min;
  final bool isShowingMainData;
  final Color gradientColor;

  @override
  State<LineChartexp> createState() => _LineChartexpState();
}

class _LineChartexpState extends State<LineChartexp> {
  late ZoomPanBehavior zoomer;
  late RangeController ctr;

  @override
  void initState() {
    // var meu = zpeak;
    // meu.sort();
    // print("${meu.first} - ${meu.last}");
    ctr = RangeController(
        start: double.parse(widget.time.first),
        end: double.parse(widget.time.last));
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
        SfCartesianChart(backgroundColor: Colors.black,
          title: ChartTitle(text: widget.ytitle),
          primaryYAxis: NumericAxis(
            maximum: widget.max,
            isVisible: true,
            minimum: widget.min,
            title: AxisTitle(
              text: "Acceleration (m/s\u00B2)",
              textStyle: GoogleFonts.roboto(fontSize: 10),
            ),
            labelStyle: GoogleFonts.roboto(fontSize: 8),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          primaryXAxis: NumericAxis(
            rangeController: ctr,
            minimum: double.parse(widget.time.first),
            maximum: double.parse(widget.time.last),
            labelStyle: GoogleFonts.roboto(fontSize: 8),
            visibleMaximum: ctr.end,
            visibleMinimum: ctr.start,
            isVisible: true,
            title: AxisTitle(
              text: widget.xtitle,
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
              color: widget.gradientColor,
              splineType: SplineType.monotonic,
              xAxisName: widget.xtitle,
              yAxisName: widget.ytitle,
              opacity: 0.8,
              enableTooltip: true,
              dataSource: widget.data,
              xValueMapper: (double datum, index) =>
                  double.parse(widget.time[index]),
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
              min: double.parse(widget.time.first),
              max: double.parse(widget.time.last),
              enableDeferredUpdate: false,
              deferredUpdateDelay: 1000,
              interval: double.parse(widget.time.last) / 5,
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
