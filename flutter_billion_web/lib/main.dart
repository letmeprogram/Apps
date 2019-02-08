import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'business.dart';
import 'ecommerce.dart';
import 'ngo.dart';
import 'portfolio.dart';
import 'blog.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'myweb.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData.light(),
      routes: {
        "/portfolio": (BuildContext context) => Portfolio(),
        "/blog": (BuildContext context) => Blog(),
        "/business": (BuildContext context) => Business(),
        "/secondscreen": (BuildContext context) => SecondScreen(),
        "/ecommerce": (BuildContext context) => Ecommerce(),
        "/ngo": (BuildContext context) => Ngo(),
        "/form": (BuildContext context) => Form(),
        "/webview": (BuildContext context) => MyWeb()
      },
    ));

class MyCard extends StatelessWidget {
  //Declare class variables
  final String label;
  final AssetImage myimage;
  final int id;

  //Constructor for YourCustomWidgetName class
  MyCard(this.label, this.myimage, this.id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id == 1) {
          Navigator.pushNamed(context, "/business");
        }
        if (id == 2) {
          Navigator.pushNamed(context, "/ngo");
        }
        if (id == 3) {
          Navigator.pushNamed(context, "/portfolio");
        }
        if (id == 4) {
          Navigator.pushNamed(context, "/blog");
        }
        if (id == 5) {
          Navigator.pushNamed(context, "/ecommerce");
        }
      },
      child: Card(

        margin: EdgeInsets.all(8.0),
        elevation: 5.0,
        shape: BeveledRectangleBorder(
            side: BorderSide(width: 0.5),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: myimage,
              colorBlendMode: BlendMode.colorBurn,
              color: Colors.blueAccent,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 22.0),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select a Category"),
      ),
      body: OfflineBuilder(
        debounceDuration: Duration.zero,
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          if (connectivity == ConnectivityResult.none) {
            return Container(
              color: Colors.white70,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Oops,",
                      style: TextStyle(color: Colors.black, fontSize: 42.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\n\nWe can see that your device is Offline!",
                      style: TextStyle(color: Colors.black, fontSize: 28.0),
                    ),
                  ],
                ),
              ),
            );
          }
          return child;
        },
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  MyCard("Business", AssetImage("images/business.jpg"), 1),
                  MyCard("NGO", AssetImage("images/ngo.jpg"), 2),
                  MyCard("Portfolio", AssetImage("images/portfolio.jpg"), 3),
                  MyCard("Blog", AssetImage("images/blog.jpg"), 4),
                  MyCard("E-Commerce", AssetImage("images/ecom.jpg"), 5),
                ],
              );
            }),
      ),
    );
  }
}
