import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: const Column(
            children: [
              MyNeumorCont(),
              MyNeumorCont(),
              MyNeumorCont(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNeumorCont extends StatelessWidget {
  const MyNeumorCont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 240, 238, 238),
            Color.fromARGB(255, 222, 221, 221),
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.sp,
            offset: Offset(3.sp, 3.sp),
            color: Colors.grey[200]!,
          ),
          BoxShadow(
            blurRadius: 8.sp,
            offset: -Offset(3.sp, 3.sp),
            color: Colors.grey[500]!,
          ),
        ],
      ),
      child: SizedBox(height: 25.h, width: double.infinity),
    );
  }
}
