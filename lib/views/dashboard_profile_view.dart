
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/dashboard_profile_controller.dart';
import 'package:take_home_pj/utils/strings.dart';

class DashboardProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DashboardProfileController controller =
    Get.put(DashboardProfileController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.profile),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Display Name : ${controller.user.displayName}',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              controller.user.email!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 120),
              child: ElevatedButton(
                child: Text(
                  STRINGS.logout,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {
                  controller.logout();
                  Get.snackbar("", "LogOut");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}