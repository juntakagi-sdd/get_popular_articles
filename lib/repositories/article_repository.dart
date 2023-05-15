import 'package:dio/dio.dart';
import 'package:get_popular_articles/api_clients/article_api_client.dart';
import 'package:get_popular_articles/models/article.dart';

class ArticleRepository {
  final ArticleApiClient _articleApiClient;

  ArticleRepository() : _articleApiClient = ArticleApiClient(Dio());

  Future<List<Article>> fetch({String? keyword}) async {
    final articles = await _articleApiClient.fetch(
      page: 1,
      perPage: 20,
      query: keyword == null ? 'stocks:>=100' : 'stocks:>=50 title:$keyword',
    );

    return articles;
  }
}
