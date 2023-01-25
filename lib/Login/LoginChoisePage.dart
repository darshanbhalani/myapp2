import 'package:flutter/material.dart';
import 'package:myapp2/Login/LoginPage.dart';
import 'package:myapp2/VariablesFile.dart';

class LoginChoisePage extends StatefulWidget {
  const LoginChoisePage({Key? key}) : super(key: key);

  @override
  State<LoginChoisePage> createState() => _LoginChoisePageState();
}

class _LoginChoisePageState extends State<LoginChoisePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:20),
                Text("Chose Login Type as",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height:20),
                InkWell(
                  onTap: () async{
                    removeLocalDetails();
                    current_user_type="Student";
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: button_color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text("Student",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
                SizedBox(height:20),
                InkWell(
                  onTap: (){
                    current_user_type="Teacher";
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: button_color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text("Teacher",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
                SizedBox(height:20),
                InkWell(
                  onTap: (){
                    // Navigator.pop(context);
                    current_user_type="Admin";
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: button_color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text("Admin",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Note : Please contect admin if you don't have account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
