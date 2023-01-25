import 'package:flutter/material.dart';
import 'package:myapp2/ClassWork.dart';
import 'package:myapp2/People.dart';
import 'package:myapp2/SideMenu.dart';
import 'ColorFile.dart';
import 'NotificationIcon.dart';
import 'PopupButton.dart';


class MyclassHomePage extends StatefulWidget {
  const MyclassHomePage({Key? key}) : super(key: key);

  @override
  State<MyclassHomePage> createState() => _MyclassHomePageState();
}

class _MyclassHomePageState extends State<MyclassHomePage>
    with SingleTickerProviderStateMixin{

  PageController controller = PageController();
  late TabController Tabcontroller;
  int _index=0;

  @override
  void initState(){
    super.initState();
    Tabcontroller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose(){
    Tabcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(hexcolor("303952")),
            title: Text("Class Name"),
            actions: [
              NotificationIcon(),
              PopupButton(),
            ],
            bottom: TabBar(
              // labelColor: Colors.black,
              isScrollable: true,
              controller: Tabcontroller,
              unselectedLabelColor: Colors.blueGrey,
              labelColor: Colors.white,
              tabs: [
                Tab(text: "Stream",icon: Icon(Icons.view_stream_outlined),),
                Tab(text: "Chat",icon: Icon(Icons.chat_outlined),),
                Tab(text: "People",icon: Icon(Icons.people_alt_outlined),),
                Tab(text: "Classwork",icon: Icon(Icons.event_note_outlined),),
                Tab(text: "Attendance",icon: Icon(Icons.analytics_outlined),),
              ],
            ),
          ),
          drawer: SideMenu(),
          body: TabBarView(
            controller: Tabcontroller,
            children: [
              Center(child: Text("Stream"),),
              Center(child: Text("Chat"),),
              People(),
              Classwork(),
              Center(child: Text("Attendance"),),
            ],
          ),
        ),
    );
  }
}
