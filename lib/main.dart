import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_book/login.dart';
import 'package:flutter_book/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application Intro',
      home: FirstRun(),
      routes: <String, WidgetBuilder> {
        "/UserPage": (BuildContext context) => new User(),
        "/LoginPage": (BuildContext context) => new Login(),
      },
    ));

List<String> imagePath = [
  "assets/images/book.png",
  "assets/images/shop.png",
  "assets/images/box.png"
];

List<String> title = [
  "Discounted Secondhand Books",
  "20 Book Grocers Nationally",
  "Sell or Recycle Your Old Books With Us"
];

List<String> description = [
  "Used and near new secondhand books at great prices.",
  "We've successfully opened 20 stores across Australia.",
  "Sell or recycle old books"
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContentPage(),
    );
  }
}

class FirstRun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new HomePage();
          default:
            if (!snapshot.hasError)
              return snapshot.data.getBool("first run") != null
                  ? new HomePage()
                  : new User();
        }
      },
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CarouselSlider(
          autoPlay: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          reverse: false,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Cubic(0.4, 0.0, 0.2, 1.0),
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          height: MediaQuery.of(context).size.height / 1.2,
          items: [0, 1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: AppIntro(i));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AppIntro extends StatefulWidget {
  int index;
  AppIntro(this.index);
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              title[widget.index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45, color: Color(0xFF5ABD8C)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                description[widget.index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFFAFDFC7)),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Image.asset(imagePath[widget.index]),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Stack(
                children: <Widget>[DotsIndicators(widget.index)],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DotsIndicators extends StatefulWidget {
  int pageIndex;
  DotsIndicators(this.pageIndex);
  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == widget.pageIndex
                    ? Color(0xFF5ABD8C)
                    : Color(0xFFAFDFC7)),
          ),
        );
      },
    );
  }
}
