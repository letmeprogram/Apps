import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'myweb.dart';

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {

  Widget myTile(String title, String img, String myurl) {
    return new ExpansionTile(
      title: MyCard(title, AssetImage(img),0),
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
                myTile("All Run Theme", "images/Theme1.png", "https://letmeprogram.github.io"),
                myTile("Your Concept Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/concept/index.html"),
                myTile("News Around", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/24-news/index.html"),
                myTile("Cube Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/cube/index.html"),
                myTile("Elate Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/elate/elate.html"),
                myTile("Glow Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/glow/index.html"),
                myTile("Greatness Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/greatness/index.html"),
                myTile("Host Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/host/index.html"),
                myTile("Ink Theme", "images/BillionWeb.png", "https://letmeprogram.github.io/Business/ink/index.html"),
              ],
            );
          }),)
    );
  }
}
