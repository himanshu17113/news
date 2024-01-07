import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/model/newsmodel.dart';
import '../../../constant/constant.dart';

class NewsService extends GetxController {
  RxList<Article> newsList = <Article>[].obs;
  static final Dio dio = Dio();
  @override
  void onInit() {
    fetchTopHeadline("in");
    super.onInit();
  }

  Future<News> fetcchEverything(String query) async {
    final String url =
        "https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=$apikey";
    try {
      final response = await dio.get(url);
      final topHeadline = News.fromMap(response.data);
      if (topHeadline.status == "ok" || topHeadline.articles != null) {
        newsList.value = topHeadline.articles!;
      }

      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      rethrow;
    }
  }

  Future<News> fetchTopHeadline(String country) async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apikey";
    try {
      final response = await dio.get(url);
      final topHeadline = News.fromMap(response.data);
      if (topHeadline.status == "ok" || topHeadline.articles != null) {
        newsList.value = topHeadline.articles!;
      }

      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      rethrow;
    }
  }
}
