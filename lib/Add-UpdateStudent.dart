import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/Temp.dart';
import 'package:random_password_generator/random_password_generator.dart';

import 'NotificationIcon.dart';
import 'PopupButton.dart';
import 'VariablesFile.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({Key? key}) : super(key: key);

  @override
  State<AddNewStudent> createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {


  @override
  void initState() {
    buildTeachersList();
    super.initState();
  }

  Future getTeacherNames() async {
    await FirebaseFirestore.instance
        .collection('Teacher')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          teacherNames.add(doc["firstName"] + ' ' + doc["lastName"]);
        });
      });
    });
  }

  Future buildTeachersList() async {
    await getTeacherNames();
    for (int i = 0; i < teacherNames.length; i++) {
      setState(() {
        teachersList.add(
            DropDownValueModel(name: teacherNames[i], value: teacherNames[i]));
      });
    }
  }



  final _formkey = GlobalKey<FormState>();

  String Course="";
  String Class="";
  String Semester="";
  bool isBranchEmpty=true;
  bool isClassEmpty=true;
  bool isSemesterEmpty=true;

  var _enrollmentno =TextEditingController();
  var _first_name=TextEditingController();
  var _middle_name=TextEditingController();
  var _last_name=TextEditingController();
  var _joining_date=TextEditingController();
  var _phoneno=TextEditingController();
  var _email =TextEditingController();
  String? _branch = "";
  String? _class ="";
  String? _department="";
  String? _sem = "";
  String? _year = "";

  void dispose() {
    _first_name.dispose();
    _middle_name.dispose();
    _last_name.dispose();
    _email.dispose();
  }

  void Clear(){
    _enrollmentno.clear();
    _first_name.clear();
    _middle_name.clear();
    _email.clear();
    _phoneno.clear();
    _last_name.clear();
    _joining_date.clear();
    _branch = "";
    _class ="";
    _department="";
    _sem = "";
    _year = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: Form(
            key: _formkey,
            child: Column(
              children: [

                TFormField("Student ID",_enrollmentno),
                TFormField("First_name", _first_name),
                TFormField("Middle_name", _middle_name),
                TFormField("Last_name", _last_name),
                TFormField("Email ID", _email),
                TFormField("Phone No", _phoneno),
                DropField("Branch", Courses),
                DropField("Semester", Semesters),
                SizedBox(height:15),
                SizedBox(height:15),
                SizedBox(height:15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async{
                        Clear();
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue,
                        ),
                        child: Center(
                            child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: () async{
                          if(_formkey.currentState!.validate()) {
                            await SubmitDetails();
                          }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue,
                        ),
                        child: Center(
                              child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  DropField(String _lable,List<DropDownValueModel> _items){
    return Column(
      children: [
        DropDownTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an option';
            }
            return null;
          },
          dropDownItemCount: 6,
          dropDownList: _items,
          dropdownRadius: 0,
          textFieldDecoration: InputDecoration(
            labelText: _lable,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
        ),
        SizedBox(height:15),
      ],
    );
  }


  Future passwordReset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: _email.text.trim(),
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset mail sended')),
      );
    });
  }

  String getPassword() {
    final RandomPasswordGenerator randomPassword = RandomPasswordGenerator();
    String newPassword = randomPassword.randomPassword(
      passwordLength: 6,
      specialChar: true,
      letters: true,
      numbers: true,
      uppercase: false,
    );
    return newPassword;
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: getPassword(),
      )
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student Created')),
        );
      });
      passwordReset();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future SubmitDetails() async{
      await FirebaseFirestore.instance
        .collection('Student')
        .doc(_enrollmentno.text)
        .set({
      "Enrollment No":_enrollmentno.text,
      "First Name":_first_name.text,
      "Middle Name":_middle_name.text,
      "Last Name":_last_name.text,
      "Email Id":_email.text,
      "Phone No":_phoneno.text,
      "Branch":_branch,
      "Class":_class,
    })
        .onError((error, _) => print('Error creating Student : $error'));
    signUp();
    addStudentInClass();
  }

  Future addStudentInClass() async{
    await FirebaseFirestore.instance
        .collection('Class').doc(_class).collection("Students").doc(_enrollmentno.text).set({});
  }
}

class UpdateStudentDetails extends StatelessWidget {
  const UpdateStudentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Student Details"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
    );
  }
}

