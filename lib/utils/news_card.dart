import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/constant/app_colors.dart';
import 'package:news/constant/date_formatter.dart';
import 'package:news/model/newsmodel.dart';
import 'package:news/more_info_news.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return MoreInfoNews(
              date: formatDate(article.publishedAt.toString()),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        "${article.source?.name.toString()} • ${dateFormatter(article.publishedAt.toString(), "mm:ss")}",
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
                                  image: CachedNetworkImageProvider(
                                      article.urlToImage.toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
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
                      colors: [primaryColorDark, grey, Colors.transparent])),
            )
          ],
        ),
      ),
    );
  }
}
