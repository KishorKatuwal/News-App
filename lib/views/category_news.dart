import 'package:flutter/material.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import 'article_view.dart';

class CategoryViews extends StatefulWidget {
  final String category;

  const CategoryViews({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryViews> createState() => _CategoryViewsState();
}

class _CategoryViewsState extends State<CategoryViews> {
  final CategoryNewsClass news1 = CategoryNewsClass();
  late List<ArticleModel> articles = [];

  bool _Loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriesNews();
  }

  void getCategoriesNews() async {
    await news1.getNews(widget.category);
    articles = news1.news;
    // print("kishor");
    // print(articles);
    setState(() {
      _Loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.save)),
          ),
        ],
        elevation: 0.0,
      ),
      body: _Loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 16),

                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl)),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
