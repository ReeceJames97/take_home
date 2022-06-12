import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/dashboard_profile_controller.dart';
import 'package:take_home_pj/utils/strings.dart';
import 'package:take_home_pj/utils/toast.dart';

class DashboardProfileView extends StatelessWidget {

  final double coverHeight = 240;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom =  profileHeight / 2;

    final DashboardProfileController controller =
        Get.put(DashboardProfileController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.profile),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(STRINGS.logout_),
                    content: const Text(STRINGS.r_u_sure_u_want_to_logout),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(STRINGS.no)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            controller.logout();
                            showToast(STRINGS.logout_successfully);
                            showDialog(context: context, builder: (context) =>
                                Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.grey,
                                    color: Colors.blue,
                                  ),
                                ),
                            );

                          },
                          child: const Text(STRINGS.yes)),
                    ],
                  ),
                );
              },child: Icon(Icons.logout),
            ),
          )
        ],
      ),

      body : Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: bottom),
                child: bgImage()),
            Positioned(
              top: top,
                child: Column(
                  children : [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(controller.user.photoURL!),
                  ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.user.displayName.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.user.email!,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]
                ),
            )
          ],
           ),
    );
  }

  Widget bgImage(){
    return Container(
      color: Colors.grey,
      child: Image.network('https://images.unsplash.com/photo-1645351666032-1a86fd2affbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZsdXR0ZXJ8ZW58MHx8MHx8&w=1000&q=80',
        width: double.infinity,
        height: coverHeight,
      fit: BoxFit.cover,),

    );
  }
}
