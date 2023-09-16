import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/Graphs/SplineGraph.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
        appBar: AppBar(
          leading: const MyBackButton(),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Graphs",
            style: GoogleFonts.roboto(
              color: blue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(0.sp),
          child: BlocConsumer<CsVuploadCubit, CsVuploadState>(
            builder: (context, state) {
              if (state is CsVuploadInitial) {
                return const Center();
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
                  child: LoadingAnimationWidget.newtonCradle(
                    color: blue,
                    size: 200,
                  ),
                );
              } else if (state is CsVuploadDataRecieve) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Result(
                            sed: state.data.data!.sed!, r: state.data.data!.r!),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      MyNeumorCont(
                        data: state.data.data!.rawPeakX!,
                        xtitle: "Time (s)",
                        ytitle: "Xraw 318",
                        gradientColor: Colors.blueAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.data!.rawPosX!,
                        min: state.data.data!.rawNegX!,
                        time: state.data.data!.rawTimeX!,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      MyNeumorCont(
                        data: state.data.data!.rawPeakY!,
                        xtitle: "Time (s)",
                        ytitle: "Yraw 318",
                        gradientColor: Colors.greenAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.data!.rawPosY!,
                        min: state.data.data!.rawNegY!,
                        time: state.data.data!.rawTimeY!,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      MyNeumorCont(
                        data: state.data.data!.rawPeakZ!,
                        xtitle: "Time (s)",
                        ytitle: "Zraw 318",
                        gradientColor: Colors.redAccent.shade400,
                        isShowingMainData: true,
                        max: state.data.data!.rawPosZ!,
                        min: state.data.data!.rawNegZ!,
                        time: state.data.data!.rawTimeZ!,
                      ),
                    ],
                  ),
                );
              } else {
                return const Center();
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
    return LineChartexp(
      data: data,
      xtitle: xtitle,
      ytitle: ytitle,
      gradientColor: gradientColor,
      isShowingMainData: true,
      max: max,
      min: min,
      time: time,
    );
  }
}
