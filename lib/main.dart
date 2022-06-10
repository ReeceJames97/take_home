import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/bindings/InstanceBinding.dart';
import 'package:take_home_pj/bindings/home_binding.dart';
import 'package:take_home_pj/routes/app_pages.dart';
import 'package:take_home_pj/utils/strings.dart';
import 'package:take_home_pj/views/login_screen_view.dart';
import 'package:take_home_pj/views/register_screen_view.dart';
import 'package:take_home_pj/views/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  print('-- main');
  WidgetsFlutterBinding.ensureInitialized();
  print('-- WidgetsFlutterBinding.ensureInitialized');
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // await Firebase.initializeApp();
  print('-- main: Firebase.initializeApp');
  HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      title: STRINGS.app_name,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white60
      ),
      // home: SplashScreenView(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
