import 'package:flutter/material.dart';
import 'package:hafidi_iptv/utils/text.dart';
import 'package:hafidi_iptv/screens/Home.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({
    Key key,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => Home()),
          );
        },
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: '⭐ Average Rating - ' + vote,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Not Loaded',
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: 'Releasing On - ' + launch_on,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your play button action here
                },
                child: Text('PLAY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
