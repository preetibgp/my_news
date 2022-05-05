import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_news/app/modules/home/controllers/category_controller.dart';

class TopHeadLinesText extends GetView<CategoryController> {
  const TopHeadLinesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top Headlines",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text("Sort: "),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.selectedCategory.isNotEmpty
                      ? controller.selectedCategory
                      : null,
                  key: UniqueKey(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey.shade900,
                  ),
                  items: <String>[
                    "Popular",
                    "Newest",
                    "Oldest",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (dynamic newVal) {
                    // controller.selectedCategory.value = newVal;
                    controller.setSelected(newVal);
                    print(newVal);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
