
import 'package:flutter/material.dart';
import 'package:take_home_pj/carousel_loading.dart';
import 'package:take_home_pj/utils/strings.dart';

class DashboardHomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.home),
      ),
      body: SafeArea(
          child: CarouselLoading())
    );
  }
}
