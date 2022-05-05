import 'package:get/get.dart';
import 'package:my_news/app/modules/home/bindings/home_binding.dart';
import 'package:my_news/app/modules/home/views/home_view.dart';
import 'package:my_news/app/modules/news_view/bindings/news_view_binding.dart';
import 'package:my_news/app/modules/news_view/views/news_view.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_VIEW,
      page: () => const NewsView(),
      binding: NewsViewBinding(),
    ),
  ];
}
