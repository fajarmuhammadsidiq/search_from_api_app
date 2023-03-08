import 'package:get/get.dart';

import '../controllers/antara_controller.dart';

class AntaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AntaraController>(
      () => AntaraController(),
    );
  }
}
