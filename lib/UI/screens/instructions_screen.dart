import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:data_hub/UI/widgets/appbar.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  void showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Start Test",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 20.sp,
                        color: red,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  "File Upload",
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CSV",
                      style: GoogleFonts.roboto(fontSize: 16.sp),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<GetcsvCubit>().getFile();
                      },
                      child: Container(
                        height: 3.5.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: yellow,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 18.sp, color: black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                BlocBuilder<GetcsvCubit, GetcsvState>(
                  builder: (context, state) {
                    if (state is GetcsvLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is GetcsvLoaded) {
                      return BlueButton(
                          text: 'Proceed',
                          onTap: () {
                            Navigator.pushNamed(context, '/td_tm_screen');
                          });
                    } else if (state is GetcsvError) {
                      return Center(
                        child: Icon(
                          Icons.error_outline_rounded,
                          color: Colors.redAccent.shade400,
                          size: 50,
                        ),
                      );
                    } else {
                      return const Center();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Appbar1(title: 'Help Guide'),
      ),
      body: Container(
        height: 800,
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/analyze/halfCompBar.png'),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 75.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions',
                        style: GoogleFonts.roboto(
                          color: blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const HeadingRow(
                          title: 'Save Data in .csv Format !', no: '1'),
                      SizedBox(
                        height: 2.h,
                      ),
                      const HeadingRow(
                          title: 'Replace HEader of .csv with below', no: '2'),
                      Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/instructions/csveg.png'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 12.w),
                          Text(
                            'Required Units',
                            style: GoogleFonts.roboto(
                                color: blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.5.h),
                      Row(
                        children: [
                          const dataNeeded(title1: 'TIME (seconds)'),
                          SizedBox(width: 2.w),
                          const dataNeeded(title1: 'X, Y, Z (m/s2)'),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      const HeadingRow(title: 'Time Parameters', no: '3'),
                      const dataNeeded(
                        title1: 'Td (duration of the daily exposure)',
                      ),
                      const dataNeeded(
                        title1: 'Tm (period over which accelareration dose',
                      ),
                      Row(
                        children: [
                          SizedBox(width: 17.w),
                          Text(
                            '(Dk) is measured',
                            style: GoogleFonts.roboto(
                                color: blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      const HeadingRow(title: 'R Factor Parameters', no: '4'),
                      const dataNeeded(
                        title1: 'N (the number of exposure days per year)',
                      ),
                      const dataNeeded(
                        title1: 'i (year counter)',
                      ),
                      const dataNeeded(
                        title1: 'n (the number of years of exposure)',
                      ),
                      const dataNeeded(
                        title1: 'b (the age at which the exposure starts)',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              BlueButton(
                  text: 'Next',
                  onTap: () {
                    showUploadDialog(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class dataNeeded extends StatelessWidget {
  final String title1;
  const dataNeeded({
    super.key,
    required this.title1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            Container(
              height: 2.h,
              width: 5.w,
              decoration: BoxDecoration(
                color: yellow,
                shape: BoxShape.circle,
                border: Border.all(color: blue),
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              title1,
              style: GoogleFonts.roboto(
                  color: blue, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}

class HeadingRow extends StatelessWidget {
  final String title;
  final String no;
  const HeadingRow({
    super.key,
    required this.title,
    required this.no,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 4.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: yellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              no,
              style: GoogleFonts.roboto(
                  color: blue, fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            // child: Container(
            //   height: 2.h,
            //   width: 5.w,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/analyze/checklistIc.png'),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          title,
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
