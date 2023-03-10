import 'package:get/get.dart';

import '../controllers/list_article_controller.dart';

class ListArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListArticleController>(
      () => ListArticleController(),
    );
  }
}
