import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/utils/cards.dart';
import 'package:news/utils/news_card.dart';
import '../../../utils/box_shimmer.dart';
import '../../data/repository/top_headline_service.dart';

class VerticalNews extends StatelessWidget {
  const VerticalNews({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsService>(
        id: 'generalNews',
        assignId: true,
        init: NewsService(),
        initState: (_) {},
        builder: (cardController) {
          final sortedArticles = cardController.generalNews
            ..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
          return sortedArticles.isNotEmpty
              ? SliverList.builder(
                  //  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemCount: sortedArticles.length,
                  itemBuilder: (context, i) =>
                      Cards(article: sortedArticles[i]))
              : SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return const CardShimmer();
                  });
        });
  }
}
