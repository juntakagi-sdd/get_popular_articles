import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_popular_articles/models/article.dart';
import 'package:get_popular_articles/view_models/article_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(articleNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: const Text('Articles'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: ref.watch(keywordController),
              onFieldSubmitted: (_) {
                final notifier = ref.read(articleNotifierProvider.notifier);
                notifier.fetch();
              },
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search, size: 25),
                labelText: 'keyword',
                filled: true,
                isDense: true,
              ),
            ),
            const Divider(),
            asyncValue.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stacktrace) => Center(child: Text(error.toString())),
              data: (articles) => _buildList(articles, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Article> articles, WidgetRef ref) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          final notifier = ref.read(articleNotifierProvider.notifier);
          await notifier.fetch();
        },
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListTile(
                onTap: () => launchUrl(Uri.parse(articles[index].url!)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(articles[index].createdAt!.substring(0, 10)),
                        const SizedBox(width: 10),
                        const Icon(Icons.archive_outlined, size: 15),
                        Text(articles[index].stocksCount!.toString()),
                        const SizedBox(width: 5),
                        const Icon(Icons.favorite_outline, size: 15),
                        Text(articles[index].likesCount!.toString()),
                      ],
                    ),
                    Text(articles[index].title!, overflow: TextOverflow.ellipsis),
                  ],
                ),
                dense: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
