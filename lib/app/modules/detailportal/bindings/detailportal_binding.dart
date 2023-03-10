import 'package:get/get.dart';

import '../controllers/detailportal_controller.dart';

class DetailportalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailportalController>(
      () => DetailportalController(),
    );
  }
}
