// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      createdAt: json['created_at'] as String?,
      stocksCount: json['stocks_count'] as int?,
      likesCount: json['likes_count'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'stocks_count': instance.stocksCount,
      'likes_count': instance.likesCount,
      'title': instance.title,
      'url': instance.url,
    };
