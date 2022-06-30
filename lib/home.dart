import 'package:flutter/material.dart';
import 'package:flutter_book/search.dart';
import 'package:flutter_book/wishlist.dart';
import 'package:flutter_book/cart.dart';
import 'ui_helper.dart';

var _scaffoldKey = new GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _pageOptions = [
    _MainContent(),
    SearchScreen(),
    WishlistScreen(),
    Cart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF5ABD8C),
        ),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xFFFFFFFF),
          unselectedItemColor: Color(0x50FFFFFF),
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0x50FFFFFF)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Color(0x50FFFFFF)),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add, color: Color(0x50FFFFFF)),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Color(0x50FFFFFF)),
                label: 'Home')
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
      child: new Drawer(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.home,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Our Books",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.book,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Our Stores",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.store,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Careers",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.work,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Sell With Us",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.attach_money,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Newsletter",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.library_books,
                  color: Color(0xFF5ABD8C),
                ),
              ),
              ListTile(
                title: Text(
                  "Account",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Color(0xFF5ABD8C),
                ),
              ),
            ],
          ),
        ),
      ),
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
        TextRecentlyViewed,
        Container(
          height: 350.0,
          child: ListView(
              scrollDirection: Axis.horizontal, children: RecentlyViewedBook),
        ),
        TextMonthlyNewsletter,
        MonthlyNewsletterCard
      ],
    );
  }
}

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
                    onPressed: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
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
          ),
          Stars
        ],
      ),
    );
  }
}

class RecentlyViewedCard extends StatelessWidget {
  final String imagePath, author, bookName;

  RecentlyViewedCard(this.imagePath, this.author, this.bookName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 5, 0),
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
                    height: 240,
                    width: 157,
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

Widget get MonthlyNewsletterCard => Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Color(0x50EFEFEF),
          height: 350,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                  style: TextStyle(color: Color(0x50212121)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  obscureText: false,
                  decoration: new InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0xFF5ABD8C), width: 2),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0x80EFEFEF), width: 2),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Color(0x75000000)),
                    hintText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  obscureText: false,
                  decoration: new InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0xFF5ABD8C), width: 2),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Color(0x80EFEFEF), width: 2),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Color(0x75000000)),
                    hintText: "Email Adreess",
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      minWidth: 160,
                      color: Color(0xFF5ABD8C),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

Widget get Stars => Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Color(0xFF5ABD8C),
        ),
        Icon(
          Icons.star,
          color: Color(0xFF5ABD8C),
        ),
        Icon(
          Icons.star,
          color: Color(0xFF5ABD8C),
        ),
        Icon(
          Icons.star,
          color: Color(0xFF5ABD8C),
        ),
        Icon(
          Icons.star,
          color: Color(0xFF5ABD8C),
        )
      ],
    );

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

Widget get TextMonthlyNewsletter => Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Text(
        "Monthly Newsletter",
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
