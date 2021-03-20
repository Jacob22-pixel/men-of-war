import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: profil(),
    ),
  );
}

class profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Men of War: Assault Squad"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 50,
                      ),
                      child: Column(
                        children: <Widget>[
                          imageload(30, 150, 75,
                              'https://fanatical.imgix.net/product/original/9f616897-9ae8-454d-bb3e-7c8069399028.jpg?auto=compress,format&w=450&fit=max')
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                              "Men of War:\nAssault Squad",
                              style: TextStyle(fontSize: 15),
                            )),
                        StarsRow(3)
                      ],
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 30, left: 7, right: 7, bottom: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              spreadRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 40, right: 40, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              imageload(20, 400, 155,
                                  'https://ocdn.eu/pulscms-transforms/1/Y6jk9kqTURBXy80ZmQ4ZTM2MzYwNDM0YTJlMmYzZTg4YjdhYmQxNTE2Yy5qcGVnk5UDAADNBQDNAtCTBc0DDM0BaJQGzP_M_8z_gaEwAQ')
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StarsRow(3),
                              TextButton(
                                onPressed: () {
                                  print("Like");
                                },
                                child: Text("Like"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Text(
                            "Assault Squad is primarily a real-time tactics game, but veers more toward strategy than its predecessors due to the absence of any fixed force (i.e. no reinforcements) scenarios."
                                " It is driven by an intricate simulation that tracks ammunition and fuel, inventories for each and every unit, cover and line of sight, tank combat with penetration and deflection of shells, field of view, and much more beside."
                         "While Assault Squad is geared toward multiplayer, the new co-op Skirmish mode can be played offline without a partner."
                              "Like earlier games in the series, Assault Squad includes a direct control feature that allows the player to take control of any unit on the field. This allows fine control during firefights, such as priming grenades before throwing and aiming for specific parts on a tank."
                          "The multiplayer uses the GameSpy client and has a built in Elo rating system. Multiplayer matches can take place on dozens of maps and between the game s five factions. New multiplayer maps are released as DLC.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Roboto"),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

class StarsRow extends StatelessWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return Row(children: stars);
  }
}

class imageload extends StatelessWidget {
  final double text;
  final double text1;
  final double text2;
  final String image;

  const imageload(
      this.text,
      this.text1,
      this.text2,
      this.image, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return ClipRRect(
      borderRadius: BorderRadius.circular(text),
      child: Image.network(
        (image),
        width: text1,
        height: text2,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}