import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafidi_iptv/Screens/signin_screen.dart';

import 'favorite.dart';


class NavBar extends StatelessWidget {
  final String userEmail;

  const NavBar({Key key, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
          accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.network('https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg'
                  ,width: 90,height: 90,
                  fit: BoxFit.cover,
                ) ,
              ),
            ),
            decoration: BoxDecoration(

                image: DecorationImage(
                    image: NetworkImage(''
                        'https://t4.ftcdn.net/jpg/02/65/08/65/360_F_265086500_6Y6KSNj1PN0Y6WQ3j8jacaTyoha11lLy.jpg'),
                    fit: BoxFit.cover
                )
            ),


          ),

          ListTile(iconColor: Colors.red,
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: ()=> favorite(),
          ),
          ListTile(iconColor: Colors.red,
            leading: Icon(Icons.live_tv),
            title: Text('Live'),
            onTap: ()=> Null,
          ),
          ListTile(iconColor: Colors.red,
            leading: Icon(Icons.movie),
            title: Text('Movie'),
            onTap: ()=> Null,
          ),
          ListTile(iconColor: Colors.red,
            leading: Icon(Icons.newspaper),
            title: Text('News'),
            onTap: ()=> Null,
          ),
          Divider(),

          ListTile(iconColor: Colors.red,
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout Confirmation'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          // Perform logout action here
                          // TODO: Add your logout logic
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) => SignInScreen()));
                        },
                      ),
                    ],
                  );
                },
              );
            },

          ),















        ],
      ),

    );
  }
}
