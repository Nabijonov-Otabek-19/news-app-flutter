
class SearchArticle {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  SearchArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory SearchArticle.fromJson(Map<String, dynamic> json) => SearchArticle(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Id? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
      };
}

enum Id {
  ARS_TECHNICA,
  BBC_NEWS,
  BUSINESS_INSIDER,
  DIE_ZEIT,
  GOOGLE_NEWS,
  POLITICO,
  THE_VERGE
}

final idValues = EnumValues({
  "ars-technica": Id.ARS_TECHNICA,
  "bbc-news": Id.BBC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "die-zeit": Id.DIE_ZEIT,
  "google-news": Id.GOOGLE_NEWS,
  "politico": Id.POLITICO,
  "the-verge": Id.THE_VERGE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
