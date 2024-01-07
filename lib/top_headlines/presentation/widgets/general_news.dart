import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news/constant/app_colors.dart';
import '../../../constant/date_formatter.dart';

import '../../../more_info_news.dart';
import '../../../utils/box_shimmer.dart';
import '../../data/repository/top_headline_service.dart';

class VerticalNews extends StatelessWidget {
  const VerticalNews({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Get.put(NewsService());
    final sortedArticles = cardController.newsList
      ..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "      News", //style: AppTextStyles.headingMediumTextBlack
          ),

          Obx(() {
            if (sortedArticles.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    itemCount: sortedArticles.length,
                    itemBuilder: (context, i) {
                      final article = sortedArticles[i];
                      final date = dateFormatter(
                          article.publishedAt.toString(), "mm:ss");
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (BuildContext context) {
                              return MoreInfoNews(
                                date:
                                    formatDate(article.publishedAt.toString()),
                                sourceName: article.source?.name,
                                title: article.title,
                                content: article.content,
                                desc: article.description,
                                image: article.urlToImage,
                                sourceUrl: article.url,
                              );
                            }));
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          article.title.toString(),
                                          // style: AppTextStyles
                                          //     .headingMedium2TextBlack
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${article.source?.name.toString()} • $date",
                                          //style: AppTextStyles.body2Regular
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: article.urlToImage != null
                                        ? Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    image: NetworkImage(article
                                                        .urlToImage
                                                        .toString()),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          )
                                        : Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                height: 4,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                      primaryColorDark,
                                      grey,
                                      Colors.transparent
                                    ])),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return const CardShimmer();
                      }));
            }
          })
          // return Expanded(
          //   child: ListView.builder(
          //       shrinkWrap: true,
          //       itemCount: 10,
          //       itemBuilder: (context, i) {
          //         return  BoxShimmer();
          //       }),
          // );
        ],
      ),
    );
  }
}
