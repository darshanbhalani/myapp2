import 'package:flutter/material.dart';
import 'VariablesFile.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clicked_event_title),
      ),
      body:ListView(
        children: [
          Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage('assets/images/sportsday.png'),
                    fit:BoxFit.cover
                ),
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(20),
              ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(clicked_event_about,style: (TextStyle(fontSize: 20)),),
            ),
          )
        ],
      ),
    );
  }
}
