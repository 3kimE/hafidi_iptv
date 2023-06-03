
import 'package:flutter/material.dart';
import 'package:hafidi_iptv/Screens/splash_Page.dart';




void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(

        debugShowCheckedModeBanner: false,

        home: Splash(),
      ),
    );
  }
}
