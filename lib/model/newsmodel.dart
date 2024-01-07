// To parse this JSON data, do
//
//     final news = newsFromMap(jsonString);

import 'dart:convert';

News newsFromMap(String str) => News.fromMap(json.decode(str));

String newsToMap(News data) => json.encode(data.toMap());

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory News.fromMap(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(json["articles"]!.map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toMap())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "source": source?.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
