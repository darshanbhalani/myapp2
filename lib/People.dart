import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/ShowProfiles.dart';
String clicked_enrollmentno="";
String clicked_fname="";
String clicked_mname="";
String clicked_lname="";
String clicked_class="";
String clicked_branch="";
String clicked_email="";
String clicked_phone="";

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {




  int index=0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Student").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((snap) {
                index=index+1;
                return InkWell(
                  onTap: (){
                    clicked_enrollmentno=snap["Enrollment No"];
                    clicked_fname=snap["First Name"];
                    clicked_mname=snap["Middle Name"];
                    clicked_lname=snap["Last Name"];
                    clicked_class=snap["Class"];
                    clicked_branch=snap["Branch"];
                    clicked_email=snap["Email Id"];
                    clicked_phone=snap["Phone No"];

                    showDialog(context: context,
                        builder: (context){
                      return ProfileCard();
                        });
                  },
                  child: ListTile(
                    title: Text(snap["First Name"]+" "+snap["Last Name"],style: TextStyle(fontSize: 20, ),),
                    subtitle: Text(clicked_enrollmentno),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/bookwallpaper.jpg'),
                    ),
                    tileColor: index%2==0 ? Colors.grey[200]:Colors.white60,
                  ),
                );
              }).toList()
          );
        }
    );
  }
}


class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  setDetails(String _lable,String _data){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(_lable+" : ",style: TextStyle(fontSize: 20),),
              Flexible(child: Text(_data,style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
        Divider(thickness: 1.5,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.8,
        width: MediaQuery.of(context).size.width*0.9,
        child: Container(
          child: Card(
            elevation: 10,
            color: Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/sportsday.png'),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                            Text(clicked_enrollmentno,style: TextStyle(fontSize: 20),),
                            Text("Student")
                        ],
                      )
                    ],
                  ),
                  Divider(thickness: 3,),
                  setDetails("Name", "$clicked_fname $clicked_mname $clicked_lname"),
                  setDetails("Class", clicked_class),
                  setDetails("Branch", clicked_branch),
                  setDetails("Semester", "6th"),
                  setDetails("Year", "3rd"),
                  setDetails("Email", clicked_email),
                  setDetails("Phone No", clicked_phone),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

