// To parse this JSON data, do
//
//     final modelSearchNews = modelSearchNewsFromJson(jsonString);

import 'dart:convert';

ModelSearchNews modelSearchNewsFromJson(String str) => ModelSearchNews.fromJson(json.decode(str));

String modelSearchNewsToJson(ModelSearchNews data) => json.encode(data.toJson());

class ModelSearchNews {
    Source? source;
    dynamic author;
    String? title;
    String? description;
    String? url;
    dynamic urlToImage;
    DateTime? publishedAt;
    String? content;

    ModelSearchNews({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory ModelSearchNews.fromJson(Map<String, dynamic> json) => ModelSearchNews(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
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
    dynamic id;
    String? name;

    Source({
        this.id,
        this.name,
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
