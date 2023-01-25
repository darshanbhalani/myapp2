import 'package:flutter/material.dart';

import 'NotificationIcon.dart';
import 'PopupButton.dart';

class CreateNewClass extends StatelessWidget {
  const CreateNewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Class"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
    );
  }
}

class UpdateClassDetails extends StatelessWidget {
  const UpdateClassDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Class Details"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
    );
  }
}

