import 'dart:io';
import 'dart:typed_data';

import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/services/report_service.dart';
import 'package:data_hub/UI/Graphs/Spline3axis.dart';
import 'package:data_hub/UI/Graphs/SplineGraph.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/result.dart';
import 'package:data_hub/UI/widgets/utils.dart';
import 'package:data_hub/UI/widgets/widget_to_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  Uint8List? bytes;
  Uint8List? bytes1;

  GlobalKey? key1;
  GlobalKey? key2;
  GlobalKey? key3;
  GlobalKey? key4;

  final PdfReportService service = PdfReportService();
  int number = 0;

  Future<void> _loadImage() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    if (file.existsSync()) {
      final bytes = await file.readAsBytes();
      setState(() {
        this.bytes = bytes;
      });
    }
  }

  Future saveImage(Uint8List bytes) async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/Download/data_hub_image.png';

    final file = File(filePath);
    await file.create(recursive: true);
    await file.writeAsBytes(bytes);

    print('Image saved to Downloads directory: $filePath');
  }

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
                return const Expanded(
                    child: RiveAnimation.asset('assets/loading.riv'));
                // return Center(
                //   child: LoadingAnimationWidget.newtonCradle(
                //     color: blue,
                //     size: 200,
                //   ),
                // );
              } else if (state is CsVuploadDataRecieve) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      WidgetToImage(
                        builder: (key) {
                          key1 = key;
                          return MyNeumorCont(
                            data: state.data.data!.rawPeakY!,
                            xtitle: "Time (s)",
                            ytitle: "Yraw 318",
                            gradientColor: Colors.greenAccent.shade400,
                            isShowingMainData: true,
                            max: state.data.data!.rawPosY!,
                            min: state.data.data!.rawNegY!,
                            time: state.data.data!.rawTimeY!,
                          );
                        },
                      ),
                      // if (bytes != null) Image.memory(bytes!),
                      // Text('Image'),
                      // buildImage(bytes1),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      WidgetToImage(
                        builder: (key) {
                          key2 = key;
                          return MyNeumorCont(
                            data: state.data.data!.rawPeakZ!,
                            xtitle: "Time (s)",
                            ytitle: "Zraw 318",
                            gradientColor: Colors.redAccent.shade400,
                            isShowingMainData: true,
                            max: state.data.data!.rawPosZ!,
                            min: state.data.data!.rawNegZ!,
                            time: state.data.data!.rawTimeZ!,
                          );
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WidgetToImage(
                        builder: (key) {
                          key3 = key;
                          return ThreeAxisGraph(data: state.data);
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WidgetToImage(
                          builder: (key) {
                            key4 = key;
                            return Result(
                              sed: state.data.data!.sed!,
                              r: state.data.data!.r!,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlueButton(
                        text: 'Generate Report',
                        onTap: () async {
                          final bytes1 = await Utils.capture(key1);

                          setState(() {
                            this.bytes1 = bytes1;
                          });
                          saveImage(bytes1);

                          final data = await service.createReport();
                          service.savePdfFile("report_$number", data);
                          number++;
                        },
                      )
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

  Widget buildImage(Uint8List? bytes) {
    return bytes != null ? Image.memory(bytes) : Container();
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
