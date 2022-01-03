import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registrasi_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrasiView extends GetView<RegistrasiController> {
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
                  height: 80,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 20, width: 400),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
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
                      onPressed: () {},
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
                Center(
                  child: Text(
                    "Have an account",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
