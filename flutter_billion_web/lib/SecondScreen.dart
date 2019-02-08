import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose...", textAlign: TextAlign.center),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Hello"),
              leading: Icon(Icons.flag),
              trailing: Icon(
                Icons.done,
                color: Colors.green,
              ),
              onTap: () => Navigator.pushNamed(context, "/nextpage"),
              subtitle: Text("World"),
              isThreeLine: true,
            );
          }),
    );
  }
}
