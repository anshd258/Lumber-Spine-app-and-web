import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/UI/Graphs/SplineGraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: BlocConsumer<CsVuploadCubit, CsVuploadState>(
            builder: (context, state) {
              if (state is CsVuploadInitial) {
                return Center();
              } else if (state is CsVuploadError) {
                return Center(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Colors.redAccent.shade400,
                    size: 50,
                  ),
                );
              } else if (state is CsVuploadUploading) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is CsVuploadDataRecieve) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MyNeumorCont(
                        data: state.data.rawPeakX!,
                        xtitle: "Time",
                        ytitle: "Xraw 318",
                        gradientColor: Colors.blueAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.rawPosX!,
                        min: state.data.rawNegX!,
                        time: state.data.rawTimeX!,
                      ),
                      MyNeumorCont(
                        data: state.data.rawPeakY!,
                        xtitle: "Time",
                        ytitle: "Yraw 318",
                        gradientColor: Colors.greenAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.rawPosY!,
                        min: state.data.rawNegY!,
                        time: state.data.rawTimeY!,
                      ),
                      MyNeumorCont(
                        data: state.data.rawPeakZ!,
                        xtitle: "Time",
                        ytitle: "Zraw 318",
                        gradientColor: Colors.redAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.rawPosZ!,
                        min: state.data.rawNegZ!,
                        time: state.data.rawTimeZ!,
                      ),
                    ],
                  ),
                );
              } else {
                return Center();
              }
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}

class MyNeumorCont extends StatelessWidget {
  const MyNeumorCont(
      {super.key,
      required this.data,
      required this.time,
      required this.xtitle,
      required this.ytitle,
      required this.gradientColor,
      required this.isShowingMainData,
      required this.max,
      required this.min});
  final String xtitle;
  final String ytitle;
  final List<double> data;
  final List<String> time;
  final double max;
  final double min;
  final bool isShowingMainData;
  final Color gradientColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 240, 238, 238),
            Color.fromARGB(255, 222, 221, 221),
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.sp,
            offset: Offset(3.sp, 3.sp),
            color: Colors.grey[200]!,
          ),
          BoxShadow(
            blurRadius: 8.sp,
            offset: -Offset(3.sp, 3.sp),
            color: Colors.grey[500]!,
          ),
        ],
      ),
      child: LineChartexp(
        data: data,
        xtitle: xtitle,
        ytitle: ytitle,
        gradientColor: gradientColor,
        isShowingMainData: true,
        max: max,
        min: min,
        time: time,
      ),
    );
  }
}
