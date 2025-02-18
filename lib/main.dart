import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sparkl/res/drawable/colors/app_colors.dart';
import 'package:sparkl/res/routes/routes.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sparkl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.appColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appColor),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
      initialRoute: '/',
    );
  }
  
}


