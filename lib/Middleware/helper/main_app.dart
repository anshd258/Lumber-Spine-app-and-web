import 'package:data_hub/Middleware/bloc/CSVdata/cs_vupload_cubit.dart';
import 'package:data_hub/Middleware/bloc/CSVdata/getcsv_cubit.dart';
import 'package:data_hub/Middleware/bloc/Variabledatabloc/data_cubit_cubit.dart';
import 'package:data_hub/Middleware/bloc/web_navbar_cubit.dart';
import 'package:data_hub/Middleware/helper/device.dart';
import 'package:data_hub/Middleware/helper/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    String deviceType = MyDevice.getDeviceType(context);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CsVuploadCubit(),
          ),
          BlocProvider(
            create: (context) => GetcsvCubit(),
          ),
          BlocProvider(
            create: (context) => WebNavbarCubit(),
          ),
          BlocProvider(
            create: (context) => DataCubitCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Data Hub',
          initialRoute: deviceType == 'phone' ? '/' : '/analyze_screen',
          routes: routes,
        ),
      );
    });
  }
}
