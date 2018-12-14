import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';
//import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(Home());

String url = "https://www.mytripgo.com/";

FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();

const String testDevice = "";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Trip Go Ltd",
      home: MyApp(),
      routes: {
        "/home": (_) => MyApp(),
        "/web": (_) => WebviewScaffold(
          url: url,
          appBar: AppBar(
            title: Text("My Trip Go Ltd"),
            backgroundColor: Color(
                int.parse("#2573b9".substring(1, 7), radix: 16) +
                    0xFF000000),
          ),
          withJavascript: true,
          withLocalStorage: true,
          clearCookies: true,
          clearCache: true,
          withZoom: true,
        ),
      },
    );
  }
}
//---------------- Admob ----------------------

//final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
//  testDevices: <String>[],
//  keywords: <String>['patanjali', 'amazon', 'health', 'ayurved'],
//  birthday: new DateTime.now(),
//  childDirected: true,
//  gender: MobileAdGender.unknown,
//);
//
//BannerAd _bannerAd;
//InterstitialAd _interstitialAd;
//
//BannerAd createBannerAd() {
//  return new BannerAd(
//    adUnitId: BannerAd.testAdUnitId,
//    size: AdSize.banner,
//    targetingInfo: targetingInfo,
//    listener: (MobileAdEvent event) {
//      print("BannerAd event $event");
//    },
//  );
//}
//
//InterstitialAd createInterstitialAd() {
//  return new InterstitialAd(
//    adUnitId: "ca-app-pub-1558125090991719/3497618817",
//    targetingInfo: targetingInfo,
//    listener: (MobileAdEvent event) {
//      print("InterstitialAd event $event");
//    },
//  );
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-1558125090991719~8231070745");
//    _bannerAd = createBannerAd()..load();
    flutterWebviewPlugin.getCookies();
    flutterWebviewPlugin.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    _interstitialAd?.dispose();
//    _bannerAd?.dispose();
    flutterWebviewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Color(int.parse("#f4f9fb".substring(1, 7), radix: 16) + 0xFF000000),
      appBar: AppBar(
        title: Text("My Trip Go Ltd"),
        centerTitle: true,
        backgroundColor:
        Color(int.parse("#2573b9".substring(1, 7), radix: 16) + 0xFF000000),
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("images/Bkg.png")),
                Padding(padding: EdgeInsets.all(8.0)),
                RaisedButton(
                  color: Color(
                      int.parse("#ff0102".substring(1, 7), radix: 16) + 0xFF000000),
                  onPressed: () {
                    url = "https://www.mytripgo.com/";
                    Navigator.pushNamed(context, "/web");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Get Started ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward , color: Colors.white,)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  "\“World's leading tour and travels Booking website, Over 30,000 packages worldwide\"",
                  style: TextStyle(
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          createInterstitialAd()
//            ..load()
//            ..show();
          Share.share(
              "World's leading tour and travels Booking website, Over 30,000 packages worldwide."
                  "Book your tour at https://www.mytripgo.com");
        },
        backgroundColor:
        Color(int.parse("#ff0102".substring(1, 7), radix: 16) + 0xFF000000),
        highlightElevation: 2.0,
        child: Icon(Icons.share),
        elevation: 2.0,
        isExtended: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBarCustom(
        Color(int.parse("#2573b9".substring(1, 7), radix: 16) + 0xFF000000),
        true,
      ),
    );
  }
}

class BottomBarCustom extends StatelessWidget {
  final Color color;
  final bool hasNotch;

  BottomBarCustom(this.color, this.hasNotch);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color,
      notchMargin: 10.0,
      shape: new CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(int.parse("#2573b9".substring(1, 7), radix: 16) + 0xFF000000) ,
            ),
          )
        ],
      ),
    );
  }
}
