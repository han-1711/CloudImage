import 'package:editfoto/app/controllers/auth_controller.dart';
import 'package:editfoto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController(text: "ha@gmail.com");
  final passC = TextEditingController(text: "farhan");

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background
          Container(
            width: Get.width,
            child: Image.asset(
              "assets/images/bg-login.png",
              fit: BoxFit.cover,
            ),
          ),
          //layer body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 5),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: emailC,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20, width: 400),
                    TextFormField(
                      controller: passC,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Wajib Mengisi Password';
                        }
                      },
                    ),
                    SizedBox(height: 50, width: 400),
                    ElevatedButton(
                      onPressed: () => authC.login(emailC.text, passC.text),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF567DF4),
                        fixedSize: Size(140, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Belum punya akun ?'),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTRASI),
                    child: Text('Buat akun'),
                  )
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
