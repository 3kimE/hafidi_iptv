import 'package:flutter/cupertino.dart';

class MOVIE extends StatefulWidget {
  const MOVIE({Key key}) : super(key: key);

  @override
  State<MOVIE> createState() => _MOVIEState();
}

class _MOVIEState extends State<MOVIE> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('MOVIE '));
  }
}
