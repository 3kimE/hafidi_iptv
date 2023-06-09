import 'package:flutter/material.dart';

import 'Home2.dart';
import 'NavBar.dart';
import 'News.dart';

import 'favorite.dart';
import 'live.dart';
import 'movie.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}








class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    getUserEmail().then((email) {
      setState(() {
        userEmail = email;
      });
    });
  }

  Future<String> getUserEmail() async {
    final user = await FirebaseAuth.instance.currentUser;
    return user.email;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(

          drawer: NavBar(userEmail: userEmail),
          appBar: AppBar(
            title: Text("IRON_DEV"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.red),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.movie, color: Colors.red),
                  text: 'Movies',
                ),
                Tab(
                  icon: Icon(Icons.newspaper, color: Colors.red),
                  text: 'News',
                ),
                Tab(
                  icon: Icon(Icons.live_tv, color: Colors.red),
                  text: 'LIVE',
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  text: 'FAVORITE',
                ),
              ],
            ),
            backgroundColor: Colors.black,
            toolbarHeight: 60,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
          body: Container(

            child: TabBarView(
              children: [
                Home2(),
                MOVIE(),
                HomeNws(),
                live(),
                favorite(),
              ],
            ),
          )),
    );
  }


}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Friends',
    'Setting',
    'something',
    'account',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
