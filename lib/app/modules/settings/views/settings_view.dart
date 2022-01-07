import 'package:editfoto/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  final authC = Get.find<AuthController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(children: [
        Container(
          width: 200,
          height: 100,
          child: Text("Pengaturan"),
        ),
        Container(
          width: 200,
          child: Text("Pengaturan"),
        ),
      ]),
    );
  }
}
