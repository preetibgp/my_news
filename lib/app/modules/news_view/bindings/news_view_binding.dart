import 'package:get/get.dart';

import 'package:my_news/app/modules/news_view/controllers/news_view_controller.dart';

class NewsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsViewController>(
      () => NewsViewController(),
    );
  }
}
