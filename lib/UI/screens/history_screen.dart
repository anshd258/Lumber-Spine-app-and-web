import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar1(title: 'History'),
        ),
        body: Padding(
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
                height: 2.h,
              ),
              const HistoryCard(
                url: 'assets/home_page/hbv.png',
                title: 'Sed',
                value: '-15.99 aw',
              ),
              Divider(color: lighterGrey),
              SizedBox(
                height: 1.h,
              ),
              const HistoryCard(
                url: 'assets/home_page/lumber.png',
                title: 'R',
                value: '-15.99 aw',
              ),
              const Spacer(),
              SizedBox(height: 2.h),
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
  final String value;

  const HistoryCard({
    super.key,
    required this.url,
    this.title = '',
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
