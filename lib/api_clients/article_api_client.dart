import 'package:dio/dio.dart';
import 'package:get_popular_articles/models/article.dart';
import 'package:retrofit/retrofit.dart';

part 'article_api_client.g.dart';

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class ArticleApiClient {
  factory ArticleApiClient(Dio dio, {String baseUrl}) = _ArticleApiClient;

  @GET("/items")
  Future<List<Article>> fetch({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('query') String? query,
  });
}
