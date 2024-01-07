import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constant/constant.dart';
import 'package:news/search/service/search_controller_service.dart';
import 'package:news/utils/news_card.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});
  static final SearchxController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.deviceHeight() * .2),
          child: ColoredBox(
            color: colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 40),
              child: TextField(
                  cursorOpacityAnimates: true,
                  onSubmitted: (query) => query.isNotEmpty
                      ? searchController.fetchEverything(query)
                      : searchController.newsList.clear(),
                  onChanged: (query) => query.isNotEmpty
                      ? searchController.fetchHeadlines(query)
                      : searchController.newsList.clear(),
                  cursorWidth: 1.5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Search for topics,location",
                    prefixIcon: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  )),
            ),
          ),
        ),
        body: Obx(() => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: searchController.newsList.length,
            itemBuilder: (context, i) =>
                NewsCard(article: searchController.newsList[i]))));
  }
}
