import 'package:data_hub/Middleware/bloc/web_navbar_cubit.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/UI/screens/feedback_screen.dart';
import 'package:data_hub/UI/screens/history_screen.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:data_hub/UI/widgets/bottom_navbar.dart';
import 'package:data_hub/UI/widgets/web_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String desc =
      'The calculation of the lumbar spine response assumes that the person subjected to the vibration is seated in an upright position and does not voluntarily rise from the seat during the exposure.';

  String finalFilePath = '';

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return SafeArea(
      child: Scaffold(
        appBar: deviceType == 'phone'
            ? PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello !',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              color: blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Balwinder',
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Image(
                          image: AssetImage('assets/analyze/profile.png'))
                    ],
                  ),
                ),
              )
            : const WebAppbar(),
        body: BlocConsumer<WebNavbarCubit, WebNavbarInitial>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state.tabIndex == 1) {
              return HomeWidget(deviceType: deviceType, desc: desc);
            } else if (state.tabIndex == 2) {
              return const History();
            } else {
              return const FeedbackScreen();
            }
          },
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.deviceType,
    required this.desc,
  });

  final String deviceType;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            deviceType == 'phone'
                ? SizedBox(
                    height: 4.h,
                  )
                : SizedBox(
                    height: 7.h,
                  ),
            MyCard(
              title: 'Vibration Analysis',
              desc: desc,
              onTap: () {},
            ),
            deviceType == 'phone'
                ? SizedBox(
                    height: 4.h,
                  )
                : SizedBox(
                    height: 1.h,
                  ),
            deviceType == 'phone'
                ? GradientCircularRing(
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, '/instructions_screen');
                        GoRouter.of(context).go('/instructions_screen');
                      },
                      child: Container(
                        height: 25.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue,
                        ),
                        child: Center(
                          child: Text(
                            'Start Test',
                            style: GoogleFonts.roboto(
                              color: whiteText,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        height: 33.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteText,
                          border: Border.all(color: yellow, width: 7.sp),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, '/instructions_web_screen');
                            GoRouter.of(context).go('/instructions_web_screen');
                          },
                          child: Container(
                            margin: EdgeInsets.all(11.sp),
                            height: 5.h,
                            width: 5.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blue,
                            ),
                            child: Center(
                              child: Text(
                                'Start Test',
                                style: GoogleFonts.roboto(
                                  color: whiteText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            deviceType == 'phone'
                ? BlueButton(
                    text: 'History',
                    onTap: () {
                      // Navigator.pushNamed(context, '/history_screen');
                       GoRouter.of(context).go('/history_screen');
                    })
                : Container(),
            SizedBox(
              height: 5.h,
            ),
            deviceType == 'phone' ? const BottomNavBar() : Container(),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String desc;
  final Function onTap;
  const MyCard({
    super.key,
    required this.title,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          height: deviceType == 'phone' ? 16.h : 27.h,
          width: deviceType == 'phone' ? double.infinity : 60.w,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: whiteText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 3.h,
                    width: 12.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/home_page/w.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                desc,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
        Container(
          height: deviceType == 'phone' ? 9.h : 20.h,
          width: deviceType == 'phone' ? double.infinity : 60.w,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.sp),
              bottomRight: Radius.circular(15.sp),
            ),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 224, 223, 223).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aw',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'VDV : Daily Equivalent Static Compression Dose (Mpa)  ',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Sed: Daily Equivalent Static Compression Dose (Mpa)',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'R: Risk Factor',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}

class GradientCircularRing extends StatelessWidget {
  final Widget child;

  const GradientCircularRing({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: GradientCircularRingPainter(),
      child: child,
    );
  }
}

class GradientCircularRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 48.sp;
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [blue, yellow], // Adjust gradient colors as needed
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10; // Adjust the width of the ring as needed

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
