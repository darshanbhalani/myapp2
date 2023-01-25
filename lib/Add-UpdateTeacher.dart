import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'NotificationIcon.dart';
import 'PopupButton.dart';
import 'VariablesFile.dart';

class AddNewTeacher extends StatefulWidget {
  const AddNewTeacher({Key? key}) : super(key: key);

  @override
  State<AddNewTeacher> createState() => _AddNewTeacherState();
}

class _AddNewTeacherState extends State<AddNewTeacher> {
  final _formkey = GlobalKey<FormState>();

  List<String> Classes = ["A", "B", "C", "D", "E", "I", "J", "K"];

  List<String> Semesters = [
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th"
  ];

  String Course = "";

  String Class = "";

  String Semester = "";

  bool isBranchEmpty = true;

  bool isClassEmpty = true;

  bool isSemesterEmpty = true;

  var _enrollmentno = TextEditingController();

  var _first_name = TextEditingController();

  var _middle_name = TextEditingController();

  var _last_name = TextEditingController();

  var _joining_date = TextEditingController();

  var _phoneno = TextEditingController();

  var _email = TextEditingController();

  String? _branch = "";

  String? _class = "";

  String? _department = "";

  String? _sem = "";

  String? _year = "";

  void dispose() {
    _first_name.dispose();
    _middle_name.dispose();
    _last_name.dispose();
    _email.dispose();
  }

  void Clear() {
    _enrollmentno.clear();
    _first_name.clear();
    _middle_name.clear();
    _email.clear();
    _phoneno.clear();
    _last_name.clear();
    _joining_date.clear();
    _branch = "";
    _class = "";
    _department = "";
    _sem = "";
    _year = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Teacher Details"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TFormField("Teacher ID", _enrollmentno),
                TFormField("First_name", _first_name),
                TFormField("Middle_name", _middle_name),
                TFormField("Last_name", _last_name),
                TFormField("Email ID", _email),
                TFormField("Phone No", _phoneno),

                DropDownTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                  dropDownItemCount: 6,
                  dropDownList: Courses,
                  dropdownRadius: 0,
                  textFieldDecoration: InputDecoration(
                    labelText: "Department",
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

                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
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
                            child: Text(
                          "Clear",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
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
                            child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
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

  Future SubmitDetails() async {
    await FirebaseFirestore.instance
        .collection('Teacher')
        .doc(_enrollmentno.text)
        .set({
      "First Name": _first_name.text,
      "Middle Name": _middle_name.text,
      "Last Name": _last_name.text,
      "Email Id": _email.text,
      "Phone No": _phoneno.text,
      "Department": _department,
    });
  }
}

class UpdateTeacherDetails extends StatelessWidget {
  const UpdateTeacherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Teacher Details"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
    );
  }
}
