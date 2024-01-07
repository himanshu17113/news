import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/model/newsmodel.dart';
import '../../../constant/constant.dart';

class SearchxController extends GetxController {
  RxList<Article> newsList = <Article>[].obs;
  @override
  void onClose() {
    newsList.close();
    dio.close();
    super.onClose();
  }

  static final Dio dio = Dio();

  Future<News> fetchEverything(String query) async {
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
    Future<News> fetchHeadlines(String query) async {
     final String url =
        "https://newsapi.org/v2/top-headlines?q=$query&apiKey=$apikey";
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
