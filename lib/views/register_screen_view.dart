import 'package:flutter/material.dart';
import 'package:take_home_pj/utils/strings.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/views/login_screen_view.dart';

class RegisterScreenView extends StatefulWidget {

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.register),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ///Image
                Image.asset('assets/images/flutter.png',
                width: 100,
                height: 100,),

                SizedBox(height: 20),

                ///Text
                Text(STRINGS.registration,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),

                SizedBox(height: 10),

                ///UserName
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: STRINGS.user_name,
                      prefixIcon: Icon(Icons.person)
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),

                SizedBox(height: 10),

                ///Email
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    labelText: STRINGS.email,
                    prefixIcon: Icon(Icons.email_outlined)
                  ),
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),

                SizedBox(height: 10,),

                ///Password
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                      labelText: STRINGS.password,
                      prefixIcon: Icon(Icons.key),
                    suffixIcon:IconButton(
                        onPressed: (){
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon( isPasswordVisible ? Icons.visibility : Icons.visibility_off))
                  ),
                  style:  TextStyle(
                    fontSize: 15
                  ),
                ),

                ///SignUp Btn
                ElevatedButton.icon(
                    onPressed: (){
                      print("Sign Up");
                    },
                  icon: Icon(Icons.login),
                    label: Text(STRINGS.signup),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),

                SizedBox(height: 10),

                ///New User Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(STRINGS.already_registered),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        print("Login Now");
                        Get.off(LoginScreenView());
                      },
                      child: Text(STRINGS.login_now,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),

                SizedBox(height: 10),

                Text(STRINGS.or,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),

                SizedBox(height: 10),

                ///Sign in with google
                InkWell(
                  onTap: (){
                    print("Sign in with google");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google.png',
                            width: 40,
                            height: 40,),
                          SizedBox(width: 20),
                          Text(STRINGS.sign_in_with_google,
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
