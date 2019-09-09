import 'package:flutter/material.dart';
import 'ui_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        AppBar(),
        Container(
          height: 350.0,
          child:
              ListView(scrollDirection: Axis.horizontal, children: OurTopPicks),
        ),
        TextBestSellers,
        Container(
          height: 350.0,
          child: ListView(
              scrollDirection: Axis.horizontal, children: BestSellersBook),
        ),
        TextGenres,
        TextRecentlyViewed
      ],
    );
  }
}

Widget get TextBestSellers => Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Text(
        "Bestsellers",
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );

Widget get TextGenres => Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Text(
        "Genres",
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );

Widget get TextRecentlyViewed => Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Text(
        "Recently Viewed",
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: new Container(
            child: new Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: new Text(
                  "Our Top Picks",
                  style: new TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: new IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ])));
  }
}

class OurTopPicksCard extends StatelessWidget {
  final String imagePath, author, bookName;

  OurTopPicksCard(this.imagePath, this.author, this.bookName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0x50000000),
                blurRadius: 10.0, // has the effect of softening the shadow
                offset: Offset(
                  0, // horizontal, move right
                  10.0, // vertical, move down
                ),
              ),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 210,
                    width: 137,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              bookName,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              author,
              style: TextStyle(fontSize: 13, color: Color(0x50242126)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class BestSellersCard extends StatelessWidget {
  final String imagePath, author, bookName, stars;

  BestSellersCard(this.imagePath, this.author, this.bookName, this.stars);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0x50000000),
                blurRadius: 10.0, // has the effect of softening the shadow
                offset: Offset(
                  0, // horizontal, move right
                  10.0, // vertical, move down
                ),
              ),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 210,
                    width: 137,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              bookName,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              author,
              style: TextStyle(fontSize: 13, color: Color(0x50242126)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
