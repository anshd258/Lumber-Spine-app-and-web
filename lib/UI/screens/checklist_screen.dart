import 'package:data_hub/Middleware/constants/util.dart';
import 'package:data_hub/UI/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final allChecked = CheckBoxModal(title: 'All Checked');
  final checkBoxList1 = [
    CheckBoxModal(title: 'Sensor X, ex.3158_X'),
    CheckBoxModal(title: 'Sensor Y, ex.3158_X'),
    CheckBoxModal(title: 'Sensor Z, ex.3158_X'),
  ];
  final checkBoxList2 = [
    CheckBoxModal(title: 'Sensor X, ex.3158_WX'),
    CheckBoxModal(title: 'Sensor Y, ex.3158_WX'),
    CheckBoxModal(title: 'Sensor Z, ex.3158_WX'),
  ];
  final checkBoxList3 = [
    CheckBoxModal(title: 'al X, ex.3158_X'),
    CheckBoxModal(title: 'al Y, ex.3158_X'),
    CheckBoxModal(title: 'al Z, ex.3158_X'),
  ];

  onAllClicked(CheckBoxModal item) {
    setState(() {
      item.value = !item.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar2,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/analyze/halfBar.png'),
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 73.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(color: black),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Checklist',
                              style: GoogleFonts.roboto(
                                color: blue,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 4.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Icon(
                                Icons.refresh,
                                color: whiteText,
                                size: 20.sp,
                              ),
                            )
                          ],
                        ),
                        const HeadingRow(title: 'Posture'),
                        ...checkBoxList1.map((item) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: item.value,
                                    onChanged: (value) => onAllClicked(item),
                                  ),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.roboto(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        const HeadingRow(title: 'Weighted Posture'),
                        ...checkBoxList2.map((item) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: item.value,
                                    onChanged: (value) => onAllClicked(item),
                                  ),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.roboto(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                        const HeadingRow(title: 'aL'),
                        ...checkBoxList3.map((item) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: item.value,
                                    onChanged: (value) => onAllClicked(item),
                                  ),
                                  Text(
                                    item.title,
                                    style: GoogleFonts.roboto(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: BlueButton(
                  text: 'Next',
                  onTap: () {
                    
                    Navigator.pushNamed(context, '/R_factor_screen');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingRow extends StatelessWidget {
  final String title;
  const HeadingRow({
    super.key,
    required this.title,
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
            child: Container(
              height: 2.h,
              width: 5.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/analyze/checklistIc.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
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

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({required this.title, this.value = false});
}
