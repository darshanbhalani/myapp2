import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp2/HomePage.dart';

import 'DownloadPage.dart';
import 'HomeScreen.dart';
import 'LiveClassPage.dart';
import 'MyClassHomePage.dart';
import 'UserProfilePage.dart';
import 'package:myapp2/ColorFile.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GNav(
      hoverColor: Colors.lightBlueAccent,
      backgroundColor: Color(hexcolor("9FBCE1FF")),
      // tabBackgroundColor: Color(hexcolor("6FC4DE")),
      activeColor: Colors.blueAccent,
      gap: 5,
      padding: EdgeInsets.all(14),

      onTabChange: (index) {
        index = index;
        if(index==4){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage(),));
        }
        if(index==3){
          // Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadPage(),));
        }
        if(index==2){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LiveClassPage(),));
        }
        if(index==1){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyclassHomePage(),));
        }
        if(index==0){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
      },
      tabs: const [
        GButton(icon: Icons.home, text: "Home"),
        // GButton(icon: Icons.search,text: "Search",),
        GButton(
          icon: Icons.list_alt_sharp,
          text: "My Class",
        ),
        GButton(
          icon: Icons.video_camera_front_rounded,
          text: "Live Class",
        ),
        GButton(
          icon: Icons.folder,
          text: "Downloads",
        ),
        GButton(
          icon: Icons.account_circle,
          text: "Profile",
        ),
      ],
    );
  }
}
