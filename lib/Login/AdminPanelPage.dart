import 'package:flutter/material.dart';
import 'package:myapp2/Add-UpdateClass.dart';
import 'package:myapp2/Add-UpdateEvent.dart';
import 'package:myapp2/Add-UpdateStudent.dart';
import 'package:myapp2/Add-UpdateTeacher.dart';
import '../NotificationIcon.dart';
import '../PopupButton.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.05,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewStudent()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt,
                    size: 35,
                  ),
                  Text('Add New Student'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateStudentDetails()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline_outlined,
                    size: 35,
                  ),
                  Text('Update Student Details'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewTeacher()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_add_outlined,
                    size: 35,
                  ),
                  Text('Add New Teacher'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTeacherDetails()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: 35,
                  ),
                  Text('Update Teacher Details'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNewClass()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_home_work_outlined,
                    size: 35,
                  ),
                  Text('Create New Class'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateClassDetails()));

            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_work_outlined,
                    size: 35,
                  ),
                  Text('Update Class Details'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewEvent()));

            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    size: 35,
                  ),
                  Text('Add New Event'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateEventDetails()));
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_repeat_outlined,
                    size: 35,
                  ),
                  Text('Update Event Details'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
