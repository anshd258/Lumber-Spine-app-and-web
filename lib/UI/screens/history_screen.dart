import 'package:data_hub/Middleware/bloc/history/history_cubit.dart';
import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(kToolbarHeight),
        //   child: deviceType == 'phone'
        //       ? const Appbar1(title: 'History')
        //       : const WebAppbar(),
        // ),
        body: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    formattedDate,
                    style: GoogleFonts.roboto(
                      color: darkerGrey,
                      fontSize: deviceType == 'phone' ? 15.sp : 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'All history',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: deviceType == 'phone' ? 15.sp : 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is HistoryLoading) {
                    return Center(
                      child: LoadingAnimationWidget.newtonCradle(
                        color: blue,
                        size: 200,
                      ),
                    );
                  }
                  if (state is HistoryError) {
                    return Center(
                      child: Icon(
                        Icons.error_outline_rounded,
                        color: Colors.redAccent.shade400,
                        size: 50,
                      ),
                    );
                  }
                  if (state is HistoryLoaded) {
                    return Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Column(
                            children: state.history.val!
                                .map((e) => HistoryCard(
                                      title: e.data!.filename!,
                                      sed: e.data!.sed!.toString(),
                                      r: e.data!.r!.toString(),
                                    ))
                                .toList()),
                      ),
                    );
                  } else {
                    return Center();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void getHistory() {
    context.read<HistoryCubit>().getHistory();
  }
}

class HistoryCard extends StatelessWidget {
  final String r;
  final String title;
  final String sed;

  const HistoryCard({
    super.key,
    required this.r,
    this.title = '',
    required this.sed,
  });

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            color: blue,
            fontSize: deviceType == 'phone' ? 16.sp : 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            // Container(
            //   height: 7.h,
            //   width: 20.w,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(url),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),

            Text(
              "Sed",
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: deviceType == 'phone' ? 16.sp : 13.sp,
                fontWeight: FontWeight.normal,
              ),
            ),

            const Spacer(),
            Text(
              sed,
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: deviceType == 'phone' ? 16.sp : 13.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "R",
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: deviceType == 'phone' ? 16.sp : 13.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            Text(
              r,
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: deviceType == 'phone' ? 16.sp : 13.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
