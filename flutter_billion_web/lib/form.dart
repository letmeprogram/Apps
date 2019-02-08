import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  List categoryOption = ["Business", "NGO", "Portfolio", "Blog", "E-commerce"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: CardSettings(
        children: <Widget>[
          CardSettingsListPicker(
            contentAlign: TextAlign.center,
            icon: Icon(Icons.list),
            label: "Category of Website",
            initialValue: "Choose...",
            labelAlign: TextAlign.left,
            options: categoryOption,
          ),
          CardSettingsText(
            label: "Name of Firm",
            initialValue: "Company Name",

            validator: (value) {
              if (value == null || value.isEmpty) return 'Name is required.';
            },
          ),
        ],
      )),
    );
  }
}
