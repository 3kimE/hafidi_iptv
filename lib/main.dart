
import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';
import 'Widgets/NavBar.dart';

import 'favorite.dart';
import 'home.dart';
import 'live.dart';
import 'movie.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 4,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(

            onPressed: () {
              openDialog();


            },
            child: const Icon(Icons.add_link),
          ),


          drawer: NavBar(),
          appBar: AppBar(
            title: Text("IRON_DEV"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.white),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.movie, color: Colors.white),
                  text: 'MOVIE',
                ),
                Tab(
                  icon: Icon(Icons.live_tv, color: Colors.white),
                  text: 'LIVE',
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.white),
                  text: 'FAVORITE',
                ),
              ],
            ),
            backgroundColor: Colors.deepPurpleAccent,
            toolbarHeight: 60,
            actions: [
              IconButton(onPressed: () {

                showSearch(context: context,
                    delegate: CustomSearch()
                );



              }, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
          body: Container(
            child: TabBarView(
              children: [
                Sliderhome(),
                MOVIE(),
                live(),
                favorite(),
              ],
            ),
          )),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('add your lik'),
      content: TextField(
        decoration: InputDecoration(hintText: 'URL:'),
      ),
      actions: [
        TextButton(onPressed: () {}, child: Text('Submit')),
      ],
    ),
  );

}
class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Friends', 'Setting', 'something', 'account',

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
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
        itemBuilder: (context,index){

          var result =matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }

    );
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
        itemBuilder: (context,index){

          var result =matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }

    );
  }
}






