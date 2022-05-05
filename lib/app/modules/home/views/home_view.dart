import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/app/modules/home/controllers/home_controller.dart';
import 'package:my_news/app/modules/home/views/components/card_view.dart';
import 'package:my_news/app/modules/home/views/components/news_source_bottom_sheet.dart';
import 'package:my_news/app/modules/home/views/components/search_view.dart';
import 'package:my_news/app/modules/home/views/components/top_headline_text.dart';
import 'package:my_news/app/modules/news_view/views/news_view.dart';
import 'package:my_news/app/utils/error_page.dart';
import 'package:my_news/app/utils/no_internet_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => controller.isInternetConnected.value
            ? controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.isError.value
                    ? const ErrorPage()
                    : RefreshIndicator(
                        onRefresh: () => controller.fetchNews(),
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              excludeHeaderSemantics: true,
                              title: const Text(
                                "MyNEWS",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              backgroundColor: Colors.blue.shade700,
                              actions: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Text(
                                          "LOCATION",
                                          // textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            height: 35,
                                            child: CountryListPick(
                                              theme: CountryTheme(
                                                isShowFlag: false,
                                                isShowTitle: true,
                                                isDownIcon: false,
                                                showEnglishName: true,
                                                isShowCode: false,
                                              ),
                                              initialSelection: '+91',
                                              onChanged: (CountryCode? code) {
                                                controller.selectedCountryNews(
                                                    code!.code!);
                                              },
                                              useUiOverlay: true,
                                              useSafeArea: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: SearchView(
                                  controller: controller.searchController,
                                  onPressed: () {
                                    controller.searchNews();
                                  },
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: TopHeadLinesText(),
                            ),
                            Obx(
                              () => SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    var data = controller.newsList[index];

                                    DateTime time = DateTime.parse(
                                        data.publishedAt.toString());
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => const NewsView(),
                                            arguments: {
                                              'title': data.title,
                                              'description': data.description,
                                              'urlToImage': data.urlToImage,
                                              'newsSource': data.source!.name,
                                              'publishedAt': data.publishedAt,
                                              'url': data.url,
                                              'content': data.content,
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CardView(
                                            newsSource: data.source?.name,
                                            image: data.urlToImage ??
                                                "https://cdn.pixabay.com/photo/2013/07/12/19/16/newspaper-154444_960_720.png",
                                            title: data.title,
                                            dateTime: timeago.format(time)),
                                      ),
                                    );
                                  },
                                  childCount: controller.newsList.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
            : const NoInternetPage(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: () {
          Get.bottomSheet(NewsSourceBottomSheet());
        },
        child: const Icon(Icons.filter_list_alt, color: Colors.white),
      ),
    );
  }
}
