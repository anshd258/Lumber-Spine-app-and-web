import 'package:flutter/material.dart';

class MyDevice {
  static String getDeviceType(BuildContext context) {
    final data = MediaQuery.of(context);
    return data.size.width < 450 ? 'phone' : 'desktop';
  }
}
