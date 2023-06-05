import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ArticleModel {
  final String title;
  final String urlToImage;
  final String description;
  final String url;
  bool isFavorite;

  ArticleModel({
    @required this.title,
    @required this.urlToImage,
    @required this.description,
    @required this.url,
    this.isFavorite = false,
  });
}

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
  List<ArticleModel> favoriteNews = [];

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

  void _toggleFavorite(ArticleModel article) {
    setState(() {
      article.isFavorite = !article.isFavorite;
      if (article.isFavorite) {
        favoriteNews.add(article);
      } else {
        favoriteNews.remove(article);
      }
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
            final article = news.datatobesavedin[index];
            return GestureDetector(
              onTap: () => _showNewsDetails(article),
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
                        article.urlToImage,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                article.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                article.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  _toggleFavorite(article),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          article.description,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoriteNewsWidget(
                favoriteNews: favoriteNews,
              ),
            ),
          );
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.favorite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final ArticleModel article;

  NewsDetailPage({this.article});

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












class FavoriteNewsWidget extends StatefulWidget {
  final List<ArticleModel> favoriteNews;

  FavoriteNewsWidget({this.favoriteNews});

  @override
  _FavoriteNewsWidgetState createState() => _FavoriteNewsWidgetState();
}

class _FavoriteNewsWidgetState extends State<FavoriteNewsWidget> {
  void _deleteNews(ArticleModel article) {
    setState(() {
      widget.favoriteNews.remove(article);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black54],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.favoriteNews.length,
          itemBuilder: (context, index) {
            final article = widget.favoriteNews[index];
            return ListTile(
              title: Text(
                article.title,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                article.description,
                style: TextStyle(color: Colors.white),
              ),
              leading: Image.network(
                article.urlToImage,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteNews(article),
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}



