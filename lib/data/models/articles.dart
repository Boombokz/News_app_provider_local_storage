import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Article extends HiveObject {
  @HiveField(0)
  Source source;
  @HiveField(1)
  @JsonKey(defaultValue: 'author is missing')
  String author;
  @HiveField(2)
  String title;
  @HiveField(3)
  @JsonKey(defaultValue: 'description is missing')
  String description;
  @HiveField(4)
  String url;
  @HiveField(5)
  @JsonKey(defaultValue: 'image is missing')
  String urlToImage;
  @HiveField(6)
  DateTime publishedAt;
  @HiveField(7)
  @JsonKey(defaultValue: 'content is missing')
  String content;
  @HiveField(8, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool isFavorite;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      this.isFavorite = false});

  factory Article.fromJson(Map<String, dynamic> data) =>
      _$ArticleFromJson(data);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Source {
  @HiveField(0)
  @JsonKey(defaultValue: 'unknown')
  String id;
  @HiveField(1)
  @JsonKey(defaultValue: 'unknown')
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> data) => _$SourceFromJson(data);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
