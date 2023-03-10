import 'package:get/get.dart';

import '../modules/antara/bindings/antara_binding.dart';
import '../modules/antara/views/antara_view.dart';
import '../modules/detailportal/bindings/detailportal_binding.dart';
import '../modules/detailportal/views/detailportal_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listArticle/bindings/list_article_binding.dart';
import '../modules/listArticle/views/list_article_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ANTARA,
      page: () => const AntaraView(),
      binding: AntaraBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPORTAL,
      page: () => const DetailportalView(),
      binding: DetailportalBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ARTICLE,
      page: () => const ListArticleView(),
      binding: ListArticleBinding(),
    ),
  ];
}
