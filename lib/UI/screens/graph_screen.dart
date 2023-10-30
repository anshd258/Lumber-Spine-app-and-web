import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/Middleware/services/report_service.dart';
import 'package:data_hub/Middleware/services/report_service_web.dart';
import 'package:data_hub/Models/graphmodals.dart';
import 'package:data_hub/UI/Graphs/Spline3axis.dart';
import 'package:data_hub/UI/Graphs/SplineGraph.dart';
import 'package:data_hub/UI/Graphs/frequncygraphs.dart';
import 'package:data_hub/UI/widgets/back_button.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/result.dart';
import 'package:data_hub/UI/widgets/utils.dart';
import 'package:data_hub/UI/widgets/widget_to_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  GlobalKey? key0;
  GlobalKey? key1;
  GlobalKey? key2;
  GlobalKey? key3;
  GlobalKey? key4;
  GlobalKey? key5;
  GlobalKey? key6;
  GlobalKey? key7;

  Image? image0;
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  Image? image7;

  final PdfReportService service = PdfReportService();
  final PdfReportServiceWeb serviceWeb = PdfReportServiceWeb();
  int number = 0;

  // Future<File> saveImage(Uint8List bytes, String name) async {
  //   final directory = await getExternalStorageDirectory();
  //   final filePath = '${directory!.path}/Download/${name}.png';

  //   final file = File(filePath);
  //   await file.create(recursive: true);
  //   await file.writeAsBytes(bytes);

  //   print('Image saved to Downloads directory: $filePath');
  //   return file;
  // }

  final List<String> vadvValueNames = ['VDV', 'VDX', 'VDY', 'VDZ'];

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
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
                // return const RiveAnimation.asset('assets/loading.riv');
                return Center(
                  child: LoadingAnimationWidget.newtonCradle(
                    color: blue,
                    size: 200,
                  ),
                );
              } else if (state is CsVuploadDataRecieve) {
                final List<double?> vdvValsList = [
                  state.data.vdvValues!.vDV,
                  state.data.vdvValues!.vDVX,
                  state.data.vdvValues!.vDVY,
                  state.data.vdvValues!.vDVZ
                ];
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 17.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                        ),
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.center,
                            borderData: FlBorderData(
                                border: Border.all(color: Colors.black)),
                            groupsSpace: 15,
                            barTouchData: BarTouchData(enabled: true),
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                axisNameWidget: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                  axisNameWidget: Container(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 35),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: vadvValueNames
                                        .map(
                                          (e) => Text(
                                            e,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        )
                                        .toList()),
                              )),
                            ),
                            // barGroups: (vdvValsList)
                            //     .map(
                            //       (data) => BarChartGroupData(
                            //         x: ,
                            //         barsSpace: 10,
                            //         barRods: [
                            //           BarChartRodData(
                            //             toY: data!.toDouble(),
                            //             color: Colors.blue,
                            //             width: 24,
                            //             borderRadius: const BorderRadius.only(
                            //               topLeft: Radius.circular(6),
                            //               topRight: Radius.circular(6),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     )
                            //     .toList(),
                            barGroups: vdvValsList.asMap().entries.map((entry) {
                              final int index = entry.key;
                              final double value = entry.value ?? 0.0;

                              return BarChartGroupData(
                                x: index,
                                barsSpace: 10,
                                barRods: [
                                  BarChartRodData(
                                    toY: value.toDouble(),
                                    color: Colors.blue,
                                    width: 24,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WidgetToImage(
                        builder: (key) {
                          key0 = key;
                          return MyNeumorCont(
                            data: state.data.data!.rawPeakX!,
                            xtitle: "Time (s)",
                            ytitle: "X",
                            gradientColor:
                                const Color.fromARGB(255, 0, 146, 230),
                            isShowingMainData: true,
                            max: state.data.data!.rawPosX!,
                            min: state.data.data!.rawNegX!,
                            time: state.data.data!.rawTimeX!,
                          );
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WidgetToImage(
                        builder: (key) {
                          key1 = key;
                          return MyNeumorCont(
                            data: state.data.data!.rawPeakY!,
                            xtitle: "Time (s)",
                            ytitle: "Y",
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
                            ytitle: "Z",
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

                      WidgetToImage(
                        builder: (key) {
                          key5 = key;
                          return PlaneGraph(
                            data: state.data.ft!.amp!.proto1Unfiltered!,
                            time: state.data.ft!.amp!.time!,
                            xtitle: "Amplitude",
                            ytitle: "",
                            gradientColor: Colors.red,
                            isShowingMainData: true,
                          );
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      WidgetToImage(
                        builder: (key) {
                          key6 = key;
                          return PlaneGraph(
                            data: state.data.ft!.amp!.ref1Unfiltered!,
                            time: state.data.ft!.amp!.time!,
                            xtitle: "Amplitude",
                            ytitle: "",
                            gradientColor: Colors.blue,
                            isShowingMainData: true,
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // PlaneGraph(
                      //   data: state.data.ft!.frequency!.psdProto1Unfiltered!,
                      //   time: state.data.ft!.frequency!.fPsd!,
                      //   xtitle: "Amplitude",
                      //   ytitle: "",
                      //   gradientColor: Colors.red,
                      //   isShowingMainData: true,
                      // ),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // PlaneGraph(
                      //   data: state.data.ft!.frequency!.psdRef1Unfiltered!,
                      //   time: state.data.ft!.frequency!.fPsd!,
                      //   xtitle: "Amplitude",
                      //   ytitle: "",
                      //   gradientColor: Colors.blue,
                      //   isShowingMainData: true,
                      // ),
                      SizedBox(
                        height: 3.h,
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
                        width: deviceType == 'phone' ? 95.w : 30.w,
                        child: BlueButton(
                          text: 'Generate Report',
                          onTap: () async {
                            print('Button pressed');
                            try {
                              final bytes0 = await Utils.capture(key0);
                              final bytes1 = await Utils.capture(key1);
                              final bytes2 = await Utils.capture(key2);
                              final bytes3 = await Utils.capture(key3);
                              final bytes4 = await Utils.capture(key4);
                              final bytes5 = await Utils.capture(key5);
                              final bytes6 = await Utils.capture(key6);
                              print('Inside try block');

                              final data = deviceType == 'phone'
                                  ? await service.createReport(
                                      images: [
                                        bytes0,
                                        bytes1,
                                        bytes2,
                                        bytes3,
                                        bytes4,
                                        bytes5,
                                        bytes6,
                                      ],
                                      // state.data.data!.dx!,
                                      // state.data.data!.dxd!,
                                      // state.data.data!.dy!,
                                      // state.data.data!.dyd!,
                                      // state.data.data!.dz!,
                                      // state.data.data!.dzd!,
                                      se: state.data.data!.se!,
                                      sed: state.data.data!.sed!,
                                      r: state.data.data!.r!,
                                    )
                                  // : await serviceWeb.createReportWeb(
                                  //     images: [
                                  //       bytes0,
                                  //       bytes1,
                                  //       bytes2,
                                  //       bytes3,
                                  //       bytes4
                                  //     ],
                                  //     // state.data.data!.dx!,
                                  //     // state.data.data!.dxd!,
                                  //     // state.data.data!.dy!,
                                  //     // state.data.data!.dyd!,
                                  //     // state.data.data!.dz!,
                                  //     // state.data.data!.dzd!,
                                  //     se: state.data.data!.se!,
                                  //     sed: state.data.data!.sed!,
                                  //     r: state.data.data!.r!,
                                  //   );
                                  : await serviceWeb.createReportWeb(
                                      images: [
                                        bytes0,
                                        bytes1,
                                        bytes2,
                                        bytes3,
                                        bytes4,
                                        bytes5,
                                        bytes6,
                                      ],
                                      se: state.data.data!.se!,
                                      sed: state.data.data!.sed!,
                                      r: state.data.data!.r!,
                                      vdv: state.data.vdvValues!.vDV,
                                      vdx: state.data.vdvValues!.vDVX,
                                      vdy: state.data.vdvValues!.vDVY,
                                      vdz: state.data.vdvValues!.vDVZ,
                                    );

                              deviceType == 'phone'
                                  ? service
                                      .savePdfFile("report_$number", data)
                                      .then((value) {
                                      print('PDF Saved');
                                      const snackBar = SnackBar(
                                        content: Text(
                                            'Report has been saved to device'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    })
                                  : serviceWeb.downloadPdfInChrome(
                                      data, "report_$number");
                              print('PDF download initiated');
                              const snackBar = SnackBar(
                                content: Text('Report download initiated'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              number++;
                            } catch (e) {
                              print("Error capturing images: $e");
                            }
                          },
                        ),
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
