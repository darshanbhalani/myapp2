import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp2/Login/LoginPage.dart';

String collage_name="LDRP Institute of Technology and Research";
String current_user_enrollmentno ="";
String current_user_name="";
String current_user_first_name="";
String current_user_middle_name="";
String current_user_last_name="";
String current_user_branch = "";
String current_user_class ="";
String current_user_department="";
String current_user_joining_date="";
String current_user_sem = "";
String current_user_year = "";
String current_user_validity = "";
String current_user_phoneno="";
String current_user_email ="";
String current_user_type="";
Color button_color=(Colors.blue);
bool isHomeScreenLoaded=false;
String _null="";
String clicked_event_title="";
String clicked_event_about="";
String clicked_event_coordinator="";

List<DropDownValueModel> Courses = [
  DropDownValueModel(name: "Automobile", value: "Automobile"),
  DropDownValueModel(name: "Civil", value: "Civil"),
  DropDownValueModel(name: "Computer", value: "Computer"),
  DropDownValueModel(name: "Electrical", value: "Electrical"),
  DropDownValueModel(name: "IT", value: "IT"),
  DropDownValueModel(name: "Mechenical", value: "Mechenical"),
];

List<DropDownValueModel> Semesters = [
  DropDownValueModel(name: "1st", value: "1st"),
  DropDownValueModel(name: "2nd", value: "2nd"),
  DropDownValueModel(name: "3rd", value: "3rd"),
  DropDownValueModel(name: "4th", value: "4th"),
  DropDownValueModel(name: "5th", value: "5th"),
  DropDownValueModel(name: "6th", value: "6th"),
  DropDownValueModel(name: "7th", value: "7th"),
  DropDownValueModel(name: "8th", value: "8th"),

];


Future getClassList() async{
  await FirebaseFirestore.instance.collection("Class").snapshots();
}


Future getEmail(String collection, String id) async {
  try{
    await FirebaseFirestore.instance.collection(collection).doc(id).get()
        .then((value)  {
          print(value);
          current_user_email=value["Email Id"];
    });
  }on FirebaseException catch(error){

    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
  }
}


Future getDetails(String collection, String id) async {
  await FirebaseFirestore.instance.collection("Events").get().then((value) {
  });

  await FirebaseFirestore.instance.collection(collection).doc(id).get().then((value) {
    current_user_first_name = value["First Name"];
    current_user_middle_name = value["Middle Name"];
    print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
    current_user_last_name = value["Last Name"];
    if(current_user_type=="Student"){
      current_user_branch = value["Branch"];
      current_user_class = value["Class"];
    }
    else if(current_user_type=="Teacher"){
      current_user_department=value["Department"];
      current_user_joining_date=value["Joining Date"];
    }
    current_user_phoneno = value["Phone No"];
  });
  print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
  current_user_name="${current_user_first_name} ${current_user_middle_name} ${current_user_last_name}";
  await setDetails();
}


Future setDetails() async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString("current_user_type", current_user_type);
  sp.setString("current_user_email", current_user_email);
  sp.setString("current_user_enrollmentno", current_user_enrollmentno);
  sp.setString("current_user_first_name", current_user_first_name);
  sp.setString("current_user_middle_name", current_user_middle_name);
  sp.setString("current_user_last_name", current_user_last_name);
  sp.setString("current_user_name", current_user_name);
  sp.setString("current_user_branch", current_user_branch);
  sp.setString("current_user_class", current_user_class);
  sp.setString("current_user_phoneno", current_user_phoneno);
  sp.setString("current_user_department", current_user_department);
  sp.setString("current_user_joining_date", current_user_joining_date);
}


Future getLocalDetails() async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  current_user_type=sp.getString("current_user_type")??current_user_type;
  current_user_email =sp.getString("current_user_email")??current_user_email;
  current_user_enrollmentno= sp.getString("current_user_enrollmentno")??current_user_enrollmentno;
  current_user_first_name=sp.getString("current_user_first_name")??current_user_first_name;
  current_user_middle_name=sp.getString("current_user_middle_name")??current_user_middle_name;
  current_user_last_name=sp.getString("current_user_last_name")??current_user_last_name;
  current_user_name=sp.getString("current_user_name")??current_user_name;
  current_user_class=sp.getString("current_user_class")??current_user_class;
  current_user_branch=sp.getString("current_user_branch")??current_user_branch;
  current_user_phoneno=sp.getString("current_user_phoneno")??current_user_phoneno;
  current_user_department=sp.getString("current_user_department")??current_user_department;
  current_user_joining_date=sp.getString("current_user_joining_date")??current_user_joining_date;
  }


 Future removeLocalDetails() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.remove("current_user_type");
    await sp.remove("current_user_email");
    await sp.remove("current_user_enrollmentno");
    await sp.remove("current_user_first_name");
    await sp.remove("current_user_middle_name");
    await sp.remove("current_user_last_name");
    await sp.remove("current_user_name");
    await sp.remove("current_user_class");
    await sp.remove("current_user_branch");
    await sp.remove("current_user_phoneno");
    await sp.remove("current_user_department");
    await sp.remove("current_user_joining_date");
    // sp.setString("current_user_type",_null);
    // sp.setString("current_user_email",_null);
    // sp.setString("current_user_enrollmentno",_null);
    // sp.setString("current_user_first_name",_null);
    // sp.setString("current_user_middle_name",_null);
    // sp.setString("current_user_last_name",_null);
    // sp.setString("current_user_name", _null);
    // sp.setString("current_user_branch",_null);
    // sp.setString("current_user_class",_null);
    // sp.setString("current_user_phoneno",_null);
    // sp.setString("current_user_department",_null);
    // // sp.setString("current_user_joining_date",_null);
    // String current_user_enrollmentno ="";
    // String current_user_name="";
    // String current_user_first_name="";
    // String current_user_middle_name="";
    // String current_user_last_name="";
    // String current_user_branch = "";
    // String current_user_class ="";
    // String current_user_department="";
    // String current_user_joining_date="";
    // String current_user_sem = "";
    // String current_user_year = "";
    // String current_user_validity = "";
    // String current_user_phoneno="";
    // String current_user_email ="";
    // String current_user_type="";
    // print(current_user_type);
    // print(current_user_email);
    // print(current_user_enrollmentno);
    // print(current_user_first_name);
    // print(current_user_middle_name);
    // print(current_user_last_name);
    // print(current_user_name);
    // print(current_user_class);
    // print(current_user_branch);
    // print(current_user_phoneno);
    // print(current_user_department);
    // print(current_user_joining_date);
  }


TFormField(String _lable,TextEditingController _controller) {
  return Column(
    children: [
      TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "Enter $_lable";
          }
        },
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
                width: 3,
              )
          ),
          labelText: _lable,
          labelStyle: TextStyle(fontSize: 15,),
        ),
      ),
      SizedBox(height:15),
    ],
  );
}

List<String> teacherNames = [];
List<DropDownValueModel> teachersList = [];

