import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news/app/data/service/binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: GlobalBinding(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
