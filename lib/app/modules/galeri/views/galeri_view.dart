import 'package:editfoto/app/modules/addgambar/views/addgambar_view.dart';
import 'package:flutter/material.dart';
import 'package:editfoto/app/controllers/auth_controller.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';

import '../controllers/galeri_controller.dart';

// class GaleriView extends GetView<GaleriController> {
//   @override
//   final authC = Get.find<AuthController>();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GaleriView'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () => authC.logout(),
//             icon: Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           'GaleriView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GaleriView extends StatefulWidget {
  @override
  final authC = Get.find<AuthController>();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<GaleriView> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Galeri'),
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(4),
                  child: GridView.builder(
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          child: FullScreenWidget(
                            child: Container(
                              margin: EdgeInsets.all(3),
                              child: FadeInImage.memoryNetwork(
                                fit: BoxFit.cover,
                                placeholder: kTransparentImage,
                                image: snapshot.data.docs[index].get('url'),
                              ),
                            ),
                          ),
                        );
                      }),
                );
        },
      ),
    );
  }
}
