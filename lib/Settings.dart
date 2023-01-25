import 'package:flutter/material.dart';
import 'PopupButton.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          PopupButton(),
        ],
      ),
    );
  }
}
