import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final validArticles = articles
        .where((article) => article.title!.isNotEmpty && article.image != null)
        .toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: validArticles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              articleModel: validArticles[index],
            ),
          );
        },
      ),
    );
  }
}
