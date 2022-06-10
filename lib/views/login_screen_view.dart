import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/login_controller.dart';
import 'package:take_home_pj/utils/strings.dart';
import 'package:take_home_pj/views/register_screen_view.dart';

class LoginScreenView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =
    Get.put(LoginController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(STRINGS.login),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Image
                Image.asset(
                  'assets/images/flutter.png',
                  width: 100,
                  height: 100,
                ),

                SizedBox(height: 20),

                ///Text
                Text(
                  STRINGS.login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 10),

                ///Email
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: STRINGS.email,
                      prefixIcon: Icon(Icons.email_outlined)),
                  style: TextStyle(fontSize: 15),
                ),

                SizedBox(
                  height: 10,
                ),

                ///Password
                Obx(() =>
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: loginController.isPasswordHidden.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: STRINGS.password,
                    prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(
                          onPressed: () {
                            // controller.isPasswordHidden.value = !controller.isPasswordHidden.value;
                            loginController.isPasswordHidden.value = !loginController.isPasswordHidden.value;
                          },
                          // icon: Icon(controller.isPasswordHidden.value
                          icon: Icon(loginController.isPasswordHidden.value
                              ? Icons.visibility
                              : Icons.visibility_off))
                  ),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
                ),

                ///Login Btn
                ElevatedButton.icon(
                  onPressed: () {
                    print("Login");
                  },
                  icon: Icon(Icons.login),
                  label: Text(STRINGS.login),
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                SizedBox(height: 10),

                ///New User Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(STRINGS.new_user),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        print("Register");
                        Get.off(() => RegisterScreenView());
                        // Get.off(RegisterScreenView());
                      },
                      child: Text(
                        STRINGS.register_now,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  STRINGS.or,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                ///Sign in with google
                InkWell(
                  onTap: () {
                    loginController.login();
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
                          Image.asset(
                            'assets/images/google.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            STRINGS.sign_in_with_google,
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
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
