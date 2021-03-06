import 'package:editfoto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:editfoto/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:editfoto/app/controllers/auth_controller.dart';
import '../controllers/registrasi_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrasiView extends GetView<RegistrasiController> {
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
                SizedBox(height: 5),
                Text(
                  "Registrasi",
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
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20, width: 400),
                    TextFormField(
                      controller: passC,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Password is required';
                        }
                      },
                    ),
                    SizedBox(height: 50, width: 400),
                    ElevatedButton(
                      onPressed: () => authC.signup(emailC.text, passC.text),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Registrasi",
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
                  Text('Sudah punya akun ?'),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text('Login'),
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
