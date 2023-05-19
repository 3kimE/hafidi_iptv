import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName:
          Text('karim elhafidi'), accountEmail: Text('example@gmail.com'),
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

          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: ()=> Null,
          ),
          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.security),
            title: Text('security'),
            onTap: ()=> Null,
          ),
          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.group),
            title: Text('Friends'),
            onTap: ()=> Null,
          ),
          Divider(),
          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.share),
            title: Text('Sahre'),
            onTap: ()=> Null,
          ),
          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: ()=> Null,
          ),

          ListTile(iconColor: Colors.deepPurpleAccent,
            leading: Icon(Icons.exit_to_app),
            title: Text('logout'),
            onTap: ()=> Null,
          ),













        ],
      ),

    );
  }
}
