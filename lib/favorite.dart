import 'package:flutter/cupertino.dart';

void main(){

  runApp(favorite());

}

class favorite extends StatelessWidget {
  const favorite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('favorite'));
  }
}

