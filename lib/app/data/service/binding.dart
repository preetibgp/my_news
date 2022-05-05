import 'package:get/get.dart';
import 'package:my_news/app/modules/home/controllers/category_controller.dart';
import 'package:my_news/app/modules/home/controllers/home_controller.dart';
import 'package:my_news/app/modules/home/controllers/newssource_controller.dart';
import 'package:my_news/app/modules/news_view/controllers/news_view_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NewsViewController>(
      () => NewsViewController(),
      fenix: true,
    );

    Get.lazyPut<NewsSourceController>(
      () => NewsSourceController(),
      fenix: true,
    );

    Get.lazyPut<CategoryController>(
      () => CategoryController(),
      fenix: true,
    );
  }
}
