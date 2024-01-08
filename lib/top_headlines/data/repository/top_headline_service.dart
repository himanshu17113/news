import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/constant/apistore.dart';
import 'package:news/model/newsmodel.dart';

class NewsService extends GetxController {
  List<Article> newsList = <Article>[];
  List<Article> generalNews = <Article>[];

  static final Dio dio = Dio();
  @override
  void onInit() {
    fetchTopHeadline("in");
    fetchEverything();
    super.onInit();
  }

  Future<News> fetchEverything() async {
    try {
      final response = await dio.get(Apis.getEverythingbyDomain);
      final topHeadline = News.fromMap(response.data);
      if (topHeadline.status == "ok" || topHeadline.articles != null) {
        generalNews = topHeadline.articles!;
        update(['generalNews']);
      }

      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      rethrow;
    }
  }

  Future<News> fetchTopHeadline(String country) async {
    try {
      final response = await dio.get(Apis.getHeadlinebyCountry(country));
      final topHeadline = News.fromMap(response.data);
      if (topHeadline.status == "ok" || topHeadline.articles != null) {
        newsList = topHeadline.articles!;
      }
      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      rethrow;
    }
  }
}
