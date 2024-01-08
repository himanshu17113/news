import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constant/constant.dart';
import 'package:news/constant/date_formatter.dart';
import 'package:news/more_info_news.dart';
import 'package:news/top_headlines/data/repository/top_headline_service.dart';
import '../../../constant/app_colors.dart';
import '../../../model/newsmodel.dart';
import '../../../utils/card_shimmer.dart';
import '../../data/repository/countries_service.dart';

class TopHeadlineCard extends StatefulWidget {
  const TopHeadlineCard({Key? key}) : super(key: key);

  @override
  State<TopHeadlineCard> createState() => _TopHeadlineCardState();
}

class _TopHeadlineCardState extends State<TopHeadlineCard> {
  String selectedCountry = "in";
  final NewsService cardController = Get.find();
  void _onCountrySelected(String countryName) {
    final countryCode = CountriesService.countryCodes[countryName];
    if (countryCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "No article was found for this country, try selecting another country please",
        style: TextStyle(fontSize: 14, color: Colors.white),
      )));
    }
    setState(() {
      selectedCountry = countryCode!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight() / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 34),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text("Headlines",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  )),
              PopupMenuButton(
                  //    padding: EdgeInsets.only(left: 140),
                  position: PopupMenuPosition.over,
                  onSelected: _onCountrySelected,
                  icon: const Icon(Icons.dashboard),
                  // child: const Text(
                  //   "Select a Country",
                  // style: TextStyle(
                  //   fontSize: 14,
                  // ),
                  // ),
                  itemBuilder: (context) {
                    return CountriesService.countryNames.map((country) {
                      return PopupMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList();
                  })
            ]),
          ),
          FutureBuilder(
            future: cardController.fetchTopHeadline(selectedCountry),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot<News?> snapshot) {
              debugPrint("future called");
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const BoxShimmer();
                // Shimmer.fromColors(
                //     baseColor: const Color(0xffF0EAEA),
                //     highlightColor: const Color(0xffD0CDCD),
                //     child: Row(
                //       children: List.generate(
                //         2,
                //         (index) => BoxShimmer(),
                //       ),
                //     ));
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                final sortedArticles = snapshot.data!.articles
                  ?..sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
                return SizedBox(
                  width: context.deviceWidth(),
                  height: context.deviceHeight() / 3.5,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: sortedArticles?.length,
                    itemBuilder: (context, i) {
                      final article = sortedArticles?[i];
                      return GestureDetector(
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
                          child: article!.urlToImage == null
                              ? Container(
                                  alignment: Alignment.bottomCenter,
                                  width: context.deviceWidth() - 20,
                                  height: context.deviceHeight() / 3,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Container(
                                    height: context.deviceHeight() / 13,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            primaryColorDark.withOpacity(0.7),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: Text(
                                      article.title.toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ))
                              : Container(
                                  alignment: Alignment.bottomCenter,
                                  width: context.deviceWidth() - 20,
                                  height: context.deviceHeight() / 3,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            article.urlToImage.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Container(
                                    height: context.deviceHeight() / 13,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            primaryColorDark.withOpacity(0.7),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: Text(
                                      article.title.toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  )));
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Container(
                    color: errorColor,
                    height: context.deviceHeight() / 4,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              } else {
                return Container(
                    color: errorColor,
                    height: context.deviceHeight() / 4,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }

              //   final vm = ref.watch(topHeadlineVM(selectedCountry));
              // return vm.when(
              //     data: (data) {
            },
            // error: (e, s) => Text(e.toString()),
            // loading: () =>
          ),
        ],
      ),
    );
  }
}
