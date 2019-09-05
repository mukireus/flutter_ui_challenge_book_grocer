import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                IconButton(
                  color: Color(0xFF5ABD8C),
                  icon: Icon(Icons.navigate_before),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Row(children: <Widget>[
              Text(
                "Sign In",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              obscureText: false,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Color(0xFF212121)),
                  hintText: "Optional Group Special Code",
                  fillColor: Color(0xFFEFEFEF)),
            ),
          )
        ],
      ),
    );
  }
}
