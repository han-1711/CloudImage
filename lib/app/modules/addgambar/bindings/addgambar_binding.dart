import 'package:get/get.dart';

import '../controllers/addgambar_controller.dart';

class AddgambarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddgambarController>(
      () => AddgambarController(),
    );
  }
}
