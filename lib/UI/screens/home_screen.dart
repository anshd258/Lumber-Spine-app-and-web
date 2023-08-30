import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import '../../Middleware/constants/colors.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<double> list = [0.72, 0.72, 0.72];

  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Firstname Lastname',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 5.h,
                    width: 11.1.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Carousel(list: list),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 9.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 243, 243, 243),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Options(
                      name: 'Analyze',
                      url: "assets/home_page/analyze.png",
                      onTap: () {
                        Navigator.pushNamed(context, '/analyze_screen');
                      },
                    ),
                    Options(
                      name: 'Sync',
                      url: "assets/home_page/refresh.png",
                      onTap: () {},
                    ),
                    Options(
                      name: 'Share',
                      url: "assets/home_page/share.png",
                      onTap: () {},
                    ),
                    Options(
                      name: 'More',
                      url: "assets/home_page/more.png",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    formattedDate,
                    style: GoogleFonts.roboto(
                      color: darkerGrey,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'All history',
                    style: GoogleFonts.roboto(
                      color: blue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              const HistoryCard(
                url: 'assets/home_page/vibration.png',
                title: 'Vibrations sensors',
                subtitle: 'Linear',
                value: '-15.99 aw',
              ),
              Divider(color: lighterGrey),
              SizedBox(
                height: 1.h,
              ),
              const HistoryCard(
                url: 'assets/home_page/hbv.png',
                title: '',
                subtitle: 'RMS-Peak-MSDV',
                value: '+2,045.00 wa',
              ),
              Divider(color: lighterGrey),
              SizedBox(
                height: 1.h,
              ),
              const HistoryCard(
                url: 'assets/home_page/lumber.png',
                title: 'Lumber Spine',
                subtitle: 'Sent',
                value: '-15.99 aw',
              ),
              Divider(color: lighterGrey),
              const Spacer(),
              const BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final String value;

  const HistoryCard({
    super.key,
    required this.url,
    this.title = '',
    this.subtitle = '',
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 7.h,
          width: 20.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 0.8.h,
            ),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                color: darkerGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.roboto(
            color: blue,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.list,
  });

  final List<double> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: list
          .map((item) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    height: 13.h,
                    width: double.infinity,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                          'Lumber Spline Measurement',
                          style: GoogleFonts.roboto(
                            color: whiteText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.sp),
                        bottomRight: Radius.circular(15.sp),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 224, 223, 223)
                              .withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          item.toString(),
                          style: GoogleFonts.roboto(
                            color: whiteText,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Mpa',
                          style: GoogleFonts.roboto(
                            color: whiteText,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}

class Options extends StatelessWidget {
  final String name;
  final String url;
  final Function onTap;
  const Options(
      {super.key, required this.name, required this.url, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 4.h,
            width: 12.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(url),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            name,
            style: GoogleFonts.roboto(
              color: blue,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
