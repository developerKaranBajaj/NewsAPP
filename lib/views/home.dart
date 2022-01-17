import 'package:flutter/material.dart';
import 'package:newsapp/helper/article_news.dart';

import 'package:newsapp/helper/data.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/widgets/blogs.dart';
import 'package:newsapp/widgets/catergory_title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<categoryModel> categories =
  //     List<categoryModel>.filled(5, categoryModel());
  // var categories = List<categoryModel?>.filled(10, null, growable: true);
  var categories = <CategoryModel>[];
  var articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    // News _newsClass = News();
    // _loadNews(_newsClass);
  }

  _loadNews(News _newsClass) async {
    _newsClass = News();
    await _newsClass.getNews();
    articles = _newsClass.news;
    setState(() {
      _loading = false;
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
      ),
      body: _loading
          ? Column(
              children: [
                //Categories-------------------------
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTitle(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName);
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTitle(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                      );
                    },
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
