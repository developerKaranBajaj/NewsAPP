import 'package:flutter/material.dart';

import 'package:newsapp/helper/article_news.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/widgets/blogs.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var articles = <ArticleModel>[];
  bool _loading = false;

  @override
  void initState() {
    

    NewsForCategorie _newsCategoryClass = NewsForCategorie();
    // News _newsCategoryClass = News();
    _loadCategoryNews(_newsCategoryClass);
    super.initState();
  }

  _loadCategoryNews(NewsForCategorie _newsClass) async {
    // _newsClass = News();
    // _newsClass;
    // _newsClass.getNewsForCategory(widget.category);
    // articles = _newsClass.news;
    NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.category);
    articles = news.news;
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BlogTitle(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
