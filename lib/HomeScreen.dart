import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/EventPage.dart';
import 'package:myapp2/HomePage-Loading.dart';
import 'package:myapp2/NotificationIcon.dart';
import 'package:myapp2/PopupButton.dart';
import 'package:myapp2/SideMenu.dart';
import 'package:myapp2/Temp.dart';
import 'package:myapp2/VariablesFile.dart';
import 'About.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LDRP Institute of Technology and Research",style: TextStyle(fontSize: 23),),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
      drawer: SideMenu(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((snap) {
              return InkWell(
                onTap: (){
                  clicked_event_title=snap["Title"];
                  clicked_event_about=snap["About"];
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EventPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage('assets/images/sportsday.png'),
                          fit:BoxFit.cover
                      ),
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(snap["Title"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,backgroundColor: Colors.white,),),
                        ),],
                    )
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),

      // body: Scrollbar(
      //   thickness: 8,
      //   radius: Radius.circular(30),
      //   child: ListView.separated(
      //       itemBuilder: (context,index){
      //         return InkWell(
      //           onTap: (){},
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      //             child: Container(
      //               height: 170,
      //               decoration: BoxDecoration(
      //                 color: Colors.lightBlueAccent[100],
      //                 borderRadius: BorderRadius.circular(20),
      //                 image: DecorationImage(
      //                     image: index%2==0 ? AssetImage('assets/images/bookwallpaper.jpg'):AssetImage('assets/images/bookwallpaper2.jpg'),
      //                     // image: AssetImage('assets/images/bookwallpaper.jpg'),
      //                     fit:BoxFit.cover
      //                 ),
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //       separatorBuilder: (context,index){return SizedBox(height: 0,);},
      //       itemCount: 15
      //   ),
      // ),
    );
  }
}

