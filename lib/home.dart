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
          height: 240.0,
          child:
              ListView(scrollDirection: Axis.horizontal, children: bookCards),
        )
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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

class BookCard extends StatelessWidget {
  final String imagePath, author, bookName;

  BookCard(this.imagePath, this.author, this.bookName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0x75000000),
                  blurRadius: 15.0, // has the effect of softening the shadow
                  offset: Offset(
                    0, // horizontal, move right
                    4.0, // vertical, move down
                  ),
                ),
              ]),
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
    );
  }
}
