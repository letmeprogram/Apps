import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'myweb.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  Widget myTile(String title, String img, String myurl) {
    return new ExpansionTile(
      title: MyCard(title, AssetImage(img), 0),
      children: <Widget>[
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Url = myurl;
              Navigator.pushNamed(context, "/webview");
            },
            child: Text("Preview")),
        FlatButton(
            onPressed: () {
              Url = "https://goo.gl/forms/06xQtzUrbzEf5iRi1";
              Navigator.pushNamed(context, "/webview");
            },
            child: Text("Go with this")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Page"),
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
                myTile("Alpha Theme", "images/BillionWeb.png",
                    "https://letmeprogram.github.io/Portfolio/alpha-916112378/index.html"),
                myTile("Bow Theme", "images/BillionWeb.png",
                    "https://letmeprogram.github.io/Portfolio/bow/index.html"),
                myTile("Concept Theme", "images/BillionWeb.png",
                    "https://letmeprogram.github.io/Portfolio/concept/index.html"),
                myTile("Photon Theme", "images/BillionWeb.png",
                    "https://letmeprogram.github.io/Portfolio/photon-631168781%20copy/index.html"),
                myTile("Profile Theme", "images/BillionWeb.png",
                    "https://letmeprogram.github.io/Portfolio/profile/index.html"),
              ],
            );
          }),)
    );
  }
}
