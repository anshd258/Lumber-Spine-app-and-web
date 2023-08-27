import 'package:data_hub/UI/screens/sign_up.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Data Hub',
      home: Scaffold(
        body: SignUp(),
      ),
    );
  }
}