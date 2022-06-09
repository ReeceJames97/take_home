import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:take_home_pj/views/login_screen_view.dart';

class SplashScreenView extends StatefulWidget {

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
          splash: Image.asset('assets/images/flutter.png'),
          duration: 2000,
          splashTransition: SplashTransition.rotationTransition,
          nextScreen: LoginScreenView()),
    );
  }
}
