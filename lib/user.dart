import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Text(
                    "Books For",
                    style: TextStyle(
                      color: Color(0xFF5ABD8C),
                      fontSize: 30,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: MaterialButton(
                          height: 56,
                          minWidth: double.infinity,
                          color: Color(0xFF5ABD8C),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          onPressed: () {Navigator.of(context).pushNamed("/LoginPage");},
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: MaterialButton(
                          height: 56,
                          minWidth: double.infinity,
                          color: Color(0xFF5ABD8C),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/books.png",
                      width: MediaQuery.of(context).size.width - 100.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
