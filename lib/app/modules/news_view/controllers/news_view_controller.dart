import 'package:get/get.dart';

class NewsViewController extends GetxController {
  String? title;
  String? description;
  String? urlToImage;
  String? source;
  DateTime? publishedAt;
  String? url;
  String? content;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments; //it gives current argument

    title = data["title"];
    description = data["description"];
    urlToImage = data["urlToImage"];
    source = data["newsSource"];
    publishedAt = data["publishedAt"];
    url = data['url'];
    content = data['content'];
  }
}
