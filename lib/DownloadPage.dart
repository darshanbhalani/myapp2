import 'package:flutter/material.dart';

import 'PopupButton.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloads"),
        actions: [
          PopupButton(),
        ],
      ),
    );
  }
}
