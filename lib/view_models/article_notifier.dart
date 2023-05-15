import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_popular_articles/models/article.dart';
import 'package:get_popular_articles/repositories/article_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_notifier.g.dart';

final keywordController = StateProvider<TextEditingController>((ref) => TextEditingController());

@riverpod
class ArticleNotifier extends _$ArticleNotifier {
  final _repository = ArticleRepository();

  @override
  Future<List<Article>> build() async {
    final articles = await _repository.fetch(keyword: null);

    return articles;
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();

    final articles = await _repository.fetch(keyword: ref.read(keywordController).text);

    state = AsyncValue.data(articles);
  }
}
