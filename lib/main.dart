import 'package:data_hub/Middleware/bloc/Repository/authrepo.dart';
import 'package:data_hub/Middleware/helper/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( RepositoryProvider(
    create: (context) => localStorage(),
    child:const MainApp(),
  ));
}
