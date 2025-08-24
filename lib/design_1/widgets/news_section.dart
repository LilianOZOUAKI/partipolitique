import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/article_model.dart';
import 'article_card.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  List<ArticleModel> _allArticles = [];
  List<ArticleModel> _filteredArticles = [];
  bool _loading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    final String jsonString = await rootBundle.loadString('assets/data/news.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final articles = jsonData.map((e) => ArticleModel.fromJson(e)).toList();

    setState(() {
      _allArticles = articles;
      _filteredArticles = articles;
      _loading = false;
    });
  }

  void _filterArticles(String query) {
    final filtered = _allArticles.where((article) {
      final titleLower = article.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower);
    }).toList();

    setState(() {
      searchQuery = query;
      _filteredArticles = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Actualités',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // Barre de recherche
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Rechercher une actualité',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: _filterArticles,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 700;

            if (_filteredArticles.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Aucune actualité trouvée.', style: TextStyle(fontSize: 16)),
              );
            }

            if (isWide) {
              return GridView.builder(
                itemCount: _filteredArticles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final article = _filteredArticles[index];
                  return ArticleCard(
                    article: article,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(article.title),
                          content: SingleChildScrollView(child: Text(article.content)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Fermer'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return ListView.builder(
                itemCount: _filteredArticles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final article = _filteredArticles[index];
                  return ArticleCard(
                    article: article,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(article.title),
                          content: SingleChildScrollView(child: Text(article.content)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Fermer'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        )

      ],
    );
  }
}
