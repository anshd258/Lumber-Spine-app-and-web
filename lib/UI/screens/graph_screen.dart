// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/Middleware/services/report_service.dart';
import 'package:data_hub/Middleware/services/report_service_web.dart';
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
  GlobalKey? key10;
  GlobalKey? key100;
  GlobalKey? key1;
  GlobalKey? key2;
  GlobalKey? key3;
  GlobalKey? key4;
  GlobalKey? key5;
  GlobalKey? key6;
  GlobalKey? key7;

  // Image? image0;
  Image? image100;
  // Image? image1;
  // Image? image2;
  // Image? image3;
  // Image? image4;
  // Image? image5;
  // Image? image6;
  // Image? image7;

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
  final List<String> awValueNames = ['Aw', 'Awx', 'Awy', 'Awz'];

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: const MyBackButton(),
          elevation: 0,
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
        body: WidgetToImage(
          builder: (key) {
            key100 = key;
            return Padding(
              padding: EdgeInsets.all(10.sp),
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
                      child: WidgetToImage(
                        builder: (key) {
                          key10 = key;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.all(2.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name : ",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          "Time : ${state.data.data!.timeStamp}",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ]),
                                ),
                              ),
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
                              Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                      width: 80.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: BarGraph(
                                                    vadvValueNames:
                                                        vadvValueNames,
                                                    vdvValsList: vdvValsList,
                                                  ),
                                                ),
                                                Text(
                                                  'Vdv, Vdvx, Vdvy, Vdvz overall - bar graph',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: BarGraph(
                                                    vadvValueNames:
                                                        awValueNames,
                                                    vdvValsList: awValsList,
                                                  ),
                                                ),
                                                Text(
                                                  'Aw, Awx, Awy, Awz overall - bar graph',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 80.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 35.h,
                                              width: 20.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 35.h,
                                                    width: 2.w,
                                                    color: const Color.fromARGB(
                                                        255, 243, 190, 67),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose Value(Aw)',
                                                          val: state
                                                              .data.aw!.aw),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose Value(Awx)',
                                                          val: state
                                                              .data.awNew!.awx),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose Value(Awy)',
                                                          val: state
                                                              .data.awNew!.awy),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose Value(Awz)',
                                                          val: state
                                                              .data.awNew!.awz),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 50),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 35.h,
                                              width: 20.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 35.h,
                                                    width: 2.w,
                                                    color: const Color.fromARGB(
                                                        255, 243, 190, 67),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ValCard(
                                                          title:
                                                              'Vibration Dose Value(VDV)',
                                                          val: state.data
                                                              .vdvValues!.vDV),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Vibration Dose Value(VDVx)',
                                                          val: state.data
                                                              .vdvValues!.vDVX),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Vibration Dose Value(VDVy)',
                                                          val: state.data
                                                              .vdvValues!.vDVY),
                                                      Container(
                                                        height: 1,
                                                        width: 23.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      ValCard(
                                                          title:
                                                              'Vibration Dose Value(VDVz)',
                                                          val: state.data
                                                              .vdvValues!.vDVZ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: WidgetToImage(
                                            builder: (key) {
                                              key0 = key;
                                              return MyNeumorCont(
                                                data:
                                                    state.data.data!.rawPeakX!,
                                                xtitle: "Time (s)",
                                                ytitle: "X",
                                                gradientColor:
                                                    const Color.fromARGB(
                                                        255, 0, 146, 230),
                                                isShowingMainData: true,
                                                max: state.data.data!.rawPosX!,
                                                min: state.data.data!.rawNegX!,
                                                time:
                                                    state.data.data!.rawTimeX!,
                                              );
                                            },
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: WidgetToImage(
                                            builder: (key) {
                                              key1 = key;
                                              return MyNeumorCont(
                                                data:
                                                    state.data.data!.rawPeakY!,
                                                xtitle: "Time (s)",
                                                ytitle: "Y",
                                                gradientColor:
                                                    Colors.greenAccent.shade400,
                                                isShowingMainData: true,
                                                max: state.data.data!.rawPosY!,
                                                min: state.data.data!.rawNegY!,
                                                time:
                                                    state.data.data!.rawTimeY!,
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
                                        Expanded(
                                          flex: 1,
                                          child: WidgetToImage(
                                            builder: (key) {
                                              key2 = key;
                                              return MyNeumorCont(
                                                data:
                                                    state.data.data!.rawPeakZ!,
                                                xtitle: "Time (s)",
                                                ytitle: "Z",
                                                gradientColor:
                                                    Colors.redAccent.shade400,
                                                isShowingMainData: true,
                                                max: state.data.data!.rawPosZ!,
                                                min: state.data.data!.rawNegZ!,
                                                time:
                                                    state.data.data!.rawTimeZ!,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 60.h,
                                      width: double.infinity,
                                      child: WidgetToImage(
                                        builder: (key) {
                                          key3 = key;
                                          return ThreeAxisGraph(
                                              data: state.data);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
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
                              Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: WidgetToImage(
                                        builder: (key) {
                                          key5 = key;
                                          return PlaneGraph(
                                            data: state.data.ft!.amp!
                                                .proto1Unfiltered!,
                                            time: state.data.ft!.amp!.time!,
                                            xtitle: "Amplitude",
                                            ytitle: "",
                                            gradientColor: Colors.red,
                                            isShowingMainData: true,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: WidgetToImage(
                                        builder: (key) {
                                          key6 = key;
                                          return PlaneGraph(
                                            data: state
                                                .data.ft!.amp!.ref1Unfiltered!,
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
                                height: 7.h,
                              ),
                              Text(
                                'Section 3: Compressive Stress (Sed)',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 25.w,
                                          child: WidgetToImage(
                                            builder: (key) {
                                              key4 = key;
                                              return Result(
                                                rRange: state.data.rRange!,
                                                sedRange: state.data.sedRange!,
                                                sed: state.data.data!.sed!,
                                                r: state.data.data!.r!,
                                              );
                                            },
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 20.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 20.h,
                                                    width: 2.w,
                                                    color: const Color.fromARGB(
                                                        255, 243, 190, 67),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DX)',
                                                          val: state
                                                              .data.aw!.aw),
                                                      SizedBox(height: 2.h),
                                                      Container(
                                                        height: 1,
                                                        width: 19.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DXD)',
                                                          val: state
                                                              .data.awNew!.awx),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Container(
                                              height: 20.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 20.h,
                                                    width: 2.w,
                                                    color: const Color.fromARGB(
                                                        255, 243, 190, 67),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DY)',
                                                          val: state
                                                              .data.aw!.aw),
                                                      SizedBox(height: 2.h),
                                                      Container(
                                                        height: 1,
                                                        width: 19.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DYD)',
                                                          val: state
                                                              .data.awNew!.awx),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Container(
                                              height: 20.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 20.h,
                                                    width: 2.w,
                                                    color: const Color.fromARGB(
                                                        255, 243, 190, 67),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DZ)',
                                                          val: state
                                                              .data.aw!.aw),
                                                      SizedBox(height: 2.h),
                                                      Container(
                                                        height: 1,
                                                        width: 19.w,
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      ValCard(
                                                          title:
                                                              'Acceleration Dose (DZD)',
                                                          val: state
                                                              .data.awNew!.awx),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 47.h,
                                          width: 27.w,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 55.h,
                                                width: 2.w,
                                                color: const Color.fromARGB(
                                                    255, 243, 190, 67),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ValCard(
                                                      title:
                                                          'Compressive Stress (SE)',
                                                      val: state.data.aw!.aw),
                                                  SizedBox(height: 2.h),
                                                  Container(
                                                    height: 1,
                                                    width: 24.w,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  ValCard(
                                                      title:
                                                          'Equivalent Static Compression Dose (SED)',
                                                      val: state.data.aw!.aw),
                                                  SizedBox(height: 2.h),
                                                  Container(
                                                    height: 1,
                                                    width: 24.w,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Text(
                                                    'N is ${widget.N}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Container(
                                                    height: 1,
                                                    width: 24.w,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Text(
                                                    'i is ${widget.i}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Container(
                                                    height: 1,
                                                    width: 24.w,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Text(
                                                    'n is ${widget.n}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Container(
                                                    height: 1,
                                                    width: 24.w,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Text(
                                                    'c is ${widget.c}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5.w),
                                          padding: EdgeInsets.all(5.sp),
                                          height: 11.h,
                                          width: 35.h,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp)),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sed  ${state.data.data!.sed!}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Divider(thickness: 2),
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
                                          width: 450,
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.yellow,
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                              width: 60.w,
                                              height: 11.h,
                                              child: Center(
                                                child: Text(
                                                  state.data.data!.remark!,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Text(
                              //   'Section 4: Remarks',
                              //   style: TextStyle(
                              //     fontSize: 16.sp,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //       padding: EdgeInsets.all(5.sp),
                              //       height: 11.h,
                              //       width: 35.h,
                              //       decoration: BoxDecoration(
                              //           border: Border.all(
                              //             color: Colors.black,
                              //           ),
                              //           borderRadius: BorderRadius.circular(5.sp)),
                              //       child: Center(
                              //         child: Column(
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Text(
                              //               'Sed  ${state.data.data!.sed!}',
                              //               style: const TextStyle(
                              //                 fontSize: 16,
                              //                 fontWeight: FontWeight.w600,
                              //               ),
                              //             ),
                              //             const Divider(thickness: 2),
                              //             Text(
                              //               'R  ${state.data.data!.r!}',
                              //               style: const TextStyle(
                              //                 fontSize: 16,
                              //                 fontWeight: FontWeight.w600,
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(width: 10.w),
                              //     Container(
                              //       padding: EdgeInsets.all(5.sp),
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(5),
                              //         color: Colors.yellow,
                              //       ),
                              //       child: Center(
                              //         child: SizedBox(
                              //           width: 60.w,
                              //           height: 11.h,
                              //           child: Text(
                              //             state.data.data!.remark!,
                              //             maxLines: 2,
                              //             textAlign: TextAlign.center,
                              //             overflow: TextOverflow.ellipsis,
                              //             style: TextStyle(
                              //               fontSize: 16.sp,
                              //               fontWeight: FontWeight.w600,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: deviceType == 'phone' ? 95.w : 30.w,
                                child: BlueButton(
                                  text: 'Generate Report',
                                  onTap: () async {
                                    print('Button pressed');
                                    Size pdfSize =
                                        key100!.currentContext!.size!;
                                    try {
                                      final bytes0 =
                                          await Utils.capture(key100);
                                      // final bytes1 = await Utils.capture(key1);
                                      // final bytes2 = await Utils.capture(key2);
                                      // final bytes3 = await Utils.capture(key3);
                                      // final bytes4 = await Utils.capture(key4);
                                      // final bytes5 = await Utils.capture(key5);
                                      // final bytes6 = await Utils.capture(key6);
                                      print('Inside try block');

                                      final data = deviceType == 'phone'
                                          ? await service.createReport(
                                              images: [
                                                bytes0,
                                                // bytes1,
                                                // bytes2,
                                                // bytes3,
                                                // bytes4,
                                                // bytes5,
                                                // bytes6,
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
                                          : await serviceWeb.createReportWeb(
                                              images: [
                                                bytes0,
                                                // bytes1,
                                                // bytes2,
                                                // bytes3,
                                                // bytes4
                                              ],
                                              // state.data.data!.dx!,
                                              // state.data.data!.dxd!,
                                              // state.data.data!.dy!,
                                              // state.data.data!.dyd!,
                                              // state.data.data!.dz!,
                                              // state.data.data!.dzd!,
                                              // se: state.data.data!.se!,
                                              // sed: state.data.data!.sed!,
                                              // r: state.data.data!.r!,
                                            );
                                      // : await serviceWeb.createReportWebsync(
                                      //     size: pdfSize, imagei: bytes0);

                                      deviceType == 'phone'
                                          ? service
                                              .savePdfFile(
                                                  "report_$number", data)
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
                                        content:
                                            Text('Report download initiated'),
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
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center();
                  }
                },
                listener: (context, state) {},
              ),
            );
          },
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
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        borderData: FlBorderData(border: Border.all(color: Colors.black)),
        groupsSpace: 5.w,
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
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
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
          val.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
