import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/constant/apistore.dart';
import 'package:news/model/newsmodel.dart';

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
    try {
      final response = await dio.get(Apis.getEverythingbyPopularity(query));
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
    try {
      final response = await dio.get(Apis.getHeadline(query));
      final topHeadline = News.fromMap(response.data);

      if (topHeadline.status == "ok" || topHeadline.articles != null) {
        if (topHeadline.articles!.isEmpty) {
          await fetchEverything(query);
        } else {
          newsList.value = topHeadline.articles!;
        }
      }

      return topHeadline;
    } on SocketException {
      throw Exception("please Connect to the internet");
    } catch (e) {
      rethrow;
    }
  }
}
