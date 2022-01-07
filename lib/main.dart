import 'package:editfoto/app/controllers/auth_controller.dart';
import 'dart:io';
import 'package:editfoto/app/modules/home/views/home_view.dart';
import 'package:editfoto/app/modules/login/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  MyWidgetsBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyImageCache extends ImageCache {
  @override
  void clear() {
    print('Clearing cache!');
    super.clear();
  }
}

class MyWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() => MyImageCache();
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
            // home: snapshot.data != null ? HomeView() : LoginView(),
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      },
    );
  }
}
