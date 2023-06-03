import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/newsmodel.dart';

class News {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews() async {
    String apiKey = '4458bc6f62da4bda8ed2a2bea5f5fd35';
    String apiUrl =
        'http://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              urlToImage: element['urlToImage'],
              description: element['description'],
              url: element['url'],
            );

            datatobesavedin.add(articleModel);
          }
        });
      }
    }
  }
}

class HomeNws extends StatefulWidget {
  @override
  _HomeNwsState createState() => _HomeNwsState();
}

class _HomeNwsState extends State<HomeNws> {
  News news = News();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  Future<void> getNewsData() async {
    await news.getNews();
    setState(() {
      _loading = false;
    });
  }

  void _showNewsDetails(ArticleModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailPage(article: article),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: news.datatobesavedin.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showNewsDetails(news.datatobesavedin[index]),
              child: Card(
                elevation: 3,
                margin:
                EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        news.datatobesavedin[index].urlToImage,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.datatobesavedin[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        news.datatobesavedin[index].description,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final ArticleModel article;

  NewsDetailPage({ this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article.urlToImage,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  article.description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
