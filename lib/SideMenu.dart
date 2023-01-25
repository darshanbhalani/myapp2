import 'package:flutter/material.dart';
import 'package:myapp2/About.dart';
import 'package:myapp2/DownloadPage.dart';
import 'package:myapp2/Login/AdminPanelPage.dart';
import 'package:myapp2/Settings.dart';
import 'package:myapp2/UserProfilePage.dart';
import 'package:myapp2/VariablesFile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage(),));
            },
            child: Stack(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPictureSize: const Size.square(80),
                  accountName: Text(current_user_name),
                  accountEmail: Text(current_user_email),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset('assets/images/asd.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image:AssetImage('assets/images/bimg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                    bottom: 8,
                    child: Text(current_user_type,style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
            },
            child: const ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Courses"),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){
            },
            child: const ListTile(
              leading: Icon(Icons.people_outline),
              title: Text("Faculties"),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadPage(),));
            },
            child: ListTile(
              leading: Icon(Icons.download_for_offline),
              title: Text("Downloads"),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share_rounded),
            title: Text("Share"),
          ),
          Divider(),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => About(),));
            },
            child: ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text("About"),
            ),
          ),
          Divider(),
          Visibility(
            visible: current_user_type=="Admin",
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPanelPage(),));
              },
              child: ListTile(
                leading: Icon(Icons.build_circle_rounded),
                title: Text("Admin Panel"),
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const Settings(),));
            },
            child: const ListTile(
              leading: Icon(Icons.settings_rounded),
              title: Text("Settings"),
            ),
          ),
        ],
      ),
    );
  }
}
