import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Article({
    String? createdAt,
    int? stocksCount,
    int? likesCount,
    String? title,
    String? url,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
