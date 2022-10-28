import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medic_meditation_app/AppRoutes/app_routes.dart';
import 'package:medic_meditation_app/AppRoutes/app_routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: getInitalRoutes(),
      getPages: AppRoutesGenerator.route,
    );
  }

  String getInitalRoutes() => AppRoutes.splashScreen;
}
