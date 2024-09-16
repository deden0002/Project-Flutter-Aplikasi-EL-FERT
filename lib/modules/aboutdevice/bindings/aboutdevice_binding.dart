import 'package:get/get.dart';

import '../controllers/aboutdevice_controller.dart';

class AboutDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutDeviceController>(
      () => AboutDeviceController(),
    );
  }
}