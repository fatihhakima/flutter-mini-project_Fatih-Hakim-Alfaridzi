// To parse this JSON data, do
//
//     final modelNewsCategory = modelNewsCategoryFromJson(jsonString);

import 'dart:convert';

ModelNewsCategory modelNewsCategoryFromJson(String str) => ModelNewsCategory.fromJson(json.decode(str));

String modelNewsCategoryToJson(ModelNewsCategory data) => json.encode(data.toJson());

class ModelNewsCategory {
    Source? source;
    String? author;
    String? title;
    dynamic description;
    String? url;
    dynamic urlToImage;
    DateTime? publishedAt;
    dynamic content;

    ModelNewsCategory({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory ModelNewsCategory.fromJson(Map<String, dynamic> json) => ModelNewsCategory(
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
    String? id;
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
