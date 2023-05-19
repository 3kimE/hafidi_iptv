import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class live extends StatefulWidget {
  const live({Key key}) : super(key: key);

  @override
  State<live> createState() => _liveState();
}

class _liveState extends State<live> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: TextField(

              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.9)),
                  hintText: "Serash here",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  )),
            ),
          )
        ],
      ),
    );
  }
}
