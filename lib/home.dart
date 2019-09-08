import 'package:flutter/material.dart';

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
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Container(
            child: new Column(
              children: <Widget>[
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget get _bookCard => Card();
