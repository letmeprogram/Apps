import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_offline/flutter_offline.dart';

String Url = "null";

final webView = new FlutterWebviewPlugin();

var hero = new Hero(tag: "h1", child: decoratedBox);

var decoratedBox = new DecoratedBox(
    decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/BillionWebLogo.jpg"),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle));

var row = Container(
  child: Row(
    children: <Widget>[
      Container(
        child: hero,
        width: 100.0,
        height: 50.0,
      ),
      //Text("Sowik"),
      Container(
        alignment: FractionalOffset(0.0, 1.0),
        padding: EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(25.0)),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                webView.reload();
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                webView.goBack();
              },
            ),
          ],
        ),
      )
    ],
  ),
);


class MyWeb extends StatefulWidget {
  @override
  _MyWebState createState() => _MyWebState();
}

class _MyWebState extends State<MyWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold),
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
        child:  WebviewScaffold(
          url: Url,
          appBar: AppBar(
            title: row,
            backgroundColor: Colors.blue,
          ),
          clearCache: true,
          clearCookies: true,
          withJavascript: true,
          withLocalStorage: true,
          withZoom: true,
        )
      ));
  }
}

