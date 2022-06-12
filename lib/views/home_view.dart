import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
        ),
      ),
    );
  }
}
