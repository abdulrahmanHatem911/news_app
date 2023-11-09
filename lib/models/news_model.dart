import 'package:news_app/core/utils/app_image.dart';

class NewsModel {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: (json["author"] == null) ? "" : json["author"],
        title: (json["title"] == null) ? "" : json["title"],
        description: (json["description"] == null) ? "" : json["description"],
        url: (json["url"] == null) ? "" : json["url"],
        urlToImage: (json["urlToImage"] == null)
            ? AppImage.tempImage
            : json["urlToImage"],
        publishedAt: (json["publishedAt"] == null) ? "" : json["publishedAt"],
        content: (json["content"] == null) ? "" : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}

class Source {
  final dynamic id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
