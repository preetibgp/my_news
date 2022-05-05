import 'package:get/get.dart';
import 'package:my_news/app/data/service/api.dart';
import 'package:my_news/app/modules/home/controllers/home_controller.dart';

class CategoryController extends GetxController {
  String selectedCategory = "Newest";

  HomeController homeController = Get.find<HomeController>();

  void setSelected(String value) {
    selectedCategory = value;
  }

  // list of categories

  Future<void> showCategoryNews() async {
    try {
      homeController.newsList.clear();

      homeController.isLoading(true);

      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.categoryWiseNews(selectedCategory);

      for (var i = 0; i < data.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          homeController.newsList.add(data.articles[i]);
        }
      }
    } finally {
      homeController.isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();

    print(selectedCategory);
  }
}
