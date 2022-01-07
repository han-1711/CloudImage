import 'package:editfoto/app/controllers/auth_controller.dart';
import 'package:editfoto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final emailC = TextEditingController(text: "");
  final passC = TextEditingController(text: "");

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
                SizedBox(height: 20),
                Text(
                  "Reset Akun",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80,
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
                    SizedBox(height: 50, width: 400),
                    ElevatedButton(
                      onPressed: () => authC.resetPassword(emailC.text),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Reset",
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
                  Text('Sudah punya akun?'),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text('Login'),
                  )
                ]),
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
