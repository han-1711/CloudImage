import 'package:editfoto/app/controllers/auth_controller.dart';
import 'package:editfoto/app/modules/addgambar/views/addgambar_view.dart';
import 'package:editfoto/app/modules/galeri/views/galeri_view.dart';
import 'package:editfoto/app/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  final authC = Get.find<AuthController>();
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<HomeView> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int index = 0;
  var myindex = 0;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon((myindex == 0) ? Icons.image : Icons.image_outlined, size: 33),
      Icon((myindex == 1) ? Icons.add_a_photo : Icons.add_a_photo_outlined,
          size: 33),
      // Icon((myindex == 2) ? Icons.person : Icons.perm_identity, size: 33),
    ];

    final screens = [
      GaleriView(),
      AddgambarView(),
      // SettingsView(),
    ];

    return Scaffold(
      body: screens[myindex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        height: 50,
        items: items,
        color: Colors.white,
        buttonBackgroundColor: Colors.grey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
      ),
    );
  }
}
