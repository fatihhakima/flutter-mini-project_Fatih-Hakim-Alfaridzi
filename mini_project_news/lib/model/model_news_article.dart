// To parse this JSON data, do
//
//     final modelNewsArticle = modelNewsArticleFromJson(jsonString);

import 'dart:convert';

ModelNewsArticle modelNewsArticleFromJson(String str) => ModelNewsArticle.fromJson(json.decode(str));

String modelNewsArticleToJson(ModelNewsArticle data) => json.encode(data.toJson());

class ModelNewsArticle {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    ModelNewsArticle({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory ModelNewsArticle.fromJson(Map<String, dynamic> json) => ModelNewsArticle(
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
