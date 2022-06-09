import 'package:flutter/material.dart';
import 'package:take_home_pj/utils/strings.dart';

class LoginScreenView extends StatefulWidget {

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.login),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ///Image
            Image.asset('assets/images/google.png',
            width: 100,
            height: 100,),

            SizedBox(height: 20),

            ///Text
            Text(STRINGS.google_sign_in,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),

            SizedBox(height: 10),

            ///Login Btn
            ElevatedButton.icon(
                onPressed: (){

                }, icon: Icon(Icons.g_mobiledata_sharp),
                label: Text(STRINGS.login_with_google),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
