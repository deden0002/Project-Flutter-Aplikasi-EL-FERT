import 'package:get/get.dart';

import '../controllers/kendali_controller.dart';

class KendaliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KendaliController>(
      () => KendaliController(),
    );
  }
}