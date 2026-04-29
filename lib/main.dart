import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/routes/app_routes.dart';
import 'package:flutter_getx_tamplete/routes/app_routes_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), //
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Kabir App',
          debugShowCheckedModeBanner: false,

          /// ── Theme ──
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
            useMaterial3: true,
          ),

          /// ── Routing ──
          initialRoute: AppRoutes.splashScreen,
          getPages: appRouteFile,

          /// ── Default Transition ──
          defaultTransition: Transition.fadeIn,
        );
      },
    );
  }
}