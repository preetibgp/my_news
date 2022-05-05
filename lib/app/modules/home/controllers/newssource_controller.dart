import 'package:get/get.dart';
import 'package:my_news/app/data/model/news_model.dart';
import 'package:my_news/app/data/service/api.dart';
import 'package:my_news/app/modules/home/controllers/home_controller.dart';
import 'package:my_news/app/utils/new_source_name.dart';

class NewsSourceController extends GetxController {
 

  HomeController homeController = Get.find<HomeController>();

  List<bool> isChecked = [
    false,
    false,
    false,
  ].obs;

  //  Show all selected news sources only

  Future<void> selectedNewsSourceNews() async {
    try {
      homeController.newsList.clear();

      homeController.isLoading(true);

      FetchFromApi fetchFromApi = FetchFromApi();

      for (int i = 0; i < isChecked.length; i++) {
        var sourceNewsList = <Article>[];
        if (isChecked[i]) {
          var data = await fetchFromApi.fetchFromSelectedNewsSource(
              NewsSourceName().newsSources[i]['id'].toString());

          for (var i = 0; i < data.articles.length; i++) {
            if (data.articles[i].urlToImage != null &&
                data.articles[i].source!.name!.isNotEmpty) {
              sourceNewsList.add(data.articles[i]);
            }
          }
        }
        homeController.newsList.addAll(sourceNewsList);
      }
    } finally {
      homeController.isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedNewsSourceNews();
  }
}
