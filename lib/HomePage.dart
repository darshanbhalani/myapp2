import 'package:flutter/material.dart';
import 'package:myapp2/HomeScreen.dart';
import 'package:myapp2/LiveClassPage.dart';
import 'package:myapp2/Login/AdminPanelPage.dart';
import 'package:myapp2/MyClassHomePage.dart';
import 'package:myapp2/SideMenu.dart';
import 'package:myapp2/UserProfilePage.dart';
import 'VariablesFile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // PageController controller = PageController();
  int bottomnavbar_index = 0;

  var screens = [
    HomeScreen(),
    MyclassHomePage(),
    LiveClassPage(),
    UserProfilePage(),
    AdminPanelPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[bottomnavbar_index],
        // floatingActionButton:Visibility(
        //   visible: current_user_type=="Admin",
        //     child: FloatingActionButton(onPressed:(){} ,child: Icon(Icons.add,size: 40,),)),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavigationBar(
          height: 55,
          backgroundColor: Colors.blue[100],
          selectedIndex: bottomnavbar_index,
          onDestinationSelected: (bottomnavbar_index) =>
          setState(() => this.bottomnavbar_index=bottomnavbar_index),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.school),
              label: 'My class',
            ),
            NavigationDestination(
              icon: Icon(Icons.video_camera_front_rounded),
              label: 'Live class',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        drawer: SideMenu(),
      ),
    );
      }
    }

