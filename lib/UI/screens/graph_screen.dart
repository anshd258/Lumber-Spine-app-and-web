// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

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

class GraphScreen extends StatefulWidget {
  final String N;
  final String i;
  final String n;
  final String c;
  const GraphScreen({
    Key? key,
    required this.N,
    required this.i,
    required this.n,
    required this.c,
  }) : super(key: key);

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
  final List<String> awValueNames = ['Awx', 'Awy', 'Awz'];

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
            // "Graphs",
            '',
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
                final List<double?> awValsList = [
                  state.data.aw!.aw,
                  state.data.awNew!.awx,
                  state.data.awNew!.awy,
                  state.data.awNew!.awz,
                ];
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Section 1: Graph',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              BarGraph(
                                vadvValueNames: vadvValueNames,
                                vdvValsList: vdvValsList,
                              ),
                              Text(
                                'Aw, Awx, Awy, Awz overall - bar graph',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              BarGraph(
                                vadvValueNames: awValueNames,
                                vdvValsList: awValsList,
                              ),
                              Text(
                                'Vdv, Vdvx, Vdvy, Vdvz overall - bar graph',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 2.w,
                                  color:
                                      const Color.fromARGB(255, 243, 190, 67),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  children: [
                                    ValCard(
                                        title: 'Acceleration Dose Value(Aw)',
                                        val: state.data.aw!.aw),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Acceleration Dose Value(Aw)',
                                        val: state.data.awNew!.awx),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Acceleration Dose Value(Aw)',
                                        val: state.data.awNew!.awy),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Acceleration Dose Value(Aw)',
                                        val: state.data.awNew!.awz),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 2.w,
                                  color:
                                      const Color.fromARGB(255, 243, 190, 67),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  children: [
                                    ValCard(
                                        title: 'Vibration Dose Value(Aw)',
                                        val: state.data.vdvValues!.vDV),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Vibration Dose Value(Aw)',
                                        val: state.data.vdvValues!.vDVX),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Vibration Dose Value(Aw)',
                                        val: state.data.vdvValues!.vDVY),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    ValCard(
                                        title: 'Vibration Dose Value(Aw)',
                                        val: state.data.vdvValues!.vDVZ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: WidgetToImage(
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
                          ),
                          SizedBox(
                            width: 30.w,
                            child: WidgetToImage(
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
                          ),
                          // if (bytes != null) Image.memory(bytes!),
                          // Text('Image'),
                          // buildImage(bytes1),
                          // SizedBox(
                          //   height: 2.h,
                          // ),
                          SizedBox(
                            width: 30.w,
                            child: WidgetToImage(
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 20.h,
                          width: double.infinity,
                          child: WidgetToImage(
                            builder: (key) {
                              key3 = key;
                              return ThreeAxisGraph(data: state.data);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Section 2: Frequency Analysis',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: WidgetToImage(
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
                          ),
                          SizedBox(
                            width: 30.w,
                            child: WidgetToImage(
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
                          ),
                        ],
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
                      Text(
                        'Section 3: Compressive Stress (Sed)',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25.w,
                            height: 100.h,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 12.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15.h,
                                      width: 2.w,
                                      color: const Color.fromARGB(
                                          255, 243, 190, 67),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ValCard(
                                            title: 'Acceleration Dose (DX)',
                                            val: state.data.aw!.aw),
                                        ValCard(
                                            title: 'Acceleration Dose (DXD)',
                                            val: state.data.awNew!.awx),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                height: 12.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15.h,
                                      width: 2.w,
                                      color: const Color.fromARGB(
                                          255, 243, 190, 67),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ValCard(
                                            title: 'Acceleration Dose (DY)',
                                            val: state.data.aw!.aw),
                                        ValCard(
                                            title: 'Acceleration Dose (DYD)',
                                            val: state.data.awNew!.awx),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                height: 12.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15.h,
                                      width: 2.w,
                                      color: const Color.fromARGB(
                                          255, 243, 190, 67),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ValCard(
                                            title: 'Acceleration Dose (DZ)',
                                            val: state.data.aw!.aw),
                                        ValCard(
                                            title: 'Acceleration Dose (DZD)',
                                            val: state.data.awNew!.awx),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 25.h,
                            width: 27.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 2.w,
                                  color:
                                      const Color.fromARGB(255, 243, 190, 67),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ValCard(
                                        title: 'Compressive Stress (SE)',
                                        val: state.data.aw!.aw),
                                    ValCard(
                                        title:
                                            'Equivalent Static Compression Dose (SED)',
                                        val: state.data.aw!.aw),
                                    Text(
                                      'N is ${widget.N}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'i is ${widget.i}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'n is ${widget.n}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'c is ${widget.c}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Section 4: Remarks',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            height: 11.h,
                            width: 35.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sed  ${state.data.data!.sed!}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Divider(),
                                  Text(
                                    'R  ${state.data.data!.r!}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.yellow,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 60.w,
                                height: 11.h,
                                child: Text(
                                  "Decrease Daily Exposure to 0.42 to get low probability of adverse health effect !",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
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

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
    required this.vadvValueNames,
    required this.vdvValsList,
  });

  final List<String> vadvValueNames;
  final List<double?> vdvValsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 34.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          borderData: FlBorderData(border: Border.all(color: Colors.black)),
          groupsSpace: 25,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              axisNameWidget: Text(
                '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            bottomTitles: AxisTitles(
                axisNameWidget: Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: vadvValueNames
                      .map(
                        (e) => Text(
                          e,
                          style: const TextStyle(fontSize: 12),
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

class ValCard extends StatelessWidget {
  final String title;
  final double? val;
  const ValCard({
    Key? key,
    required this.title,
    required this.val,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
