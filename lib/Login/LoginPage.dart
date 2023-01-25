import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/Login/ForgotPasswordPage.dart';
import 'package:myapp2/VariablesFile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formkey = GlobalKey<FormState>();
  var idcontroller =TextEditingController();
  var passwordcontroller = TextEditingController();
  var errormessage = 'ab';
  bool hover_color=false;
  Color submit_button_color = Colors.red;
  bool isLoading=false;

  void dispose(){
    super.dispose();
    idcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading:IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace_sharp,size: 35,color: Colors.black,)),
      ),
      body:SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 100,),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height:25),
                      Text(current_user_type+" Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height:25),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Id";
                          }
                        },
                        controller: idcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )
                          ),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blue,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 3,
                              )
                          ),
                          labelText: current_user_type+" ID",
                          labelStyle: TextStyle(fontSize: 15,),
                        ),
                      ),
                      SizedBox(height:25),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Password";
                          }
                        },
                        obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )
                          ),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Colors.blue,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 3,
                              )
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 15,),
                        ),
                      ),
                      SizedBox(height:15),
                      Visibility(
                          visible: errormessage.length > 2,
                          child: Text('Invalid Username or Password',style: TextStyle(fontSize: 15,color: Colors.red),)),
                      SizedBox(height:15),
                      InkWell(
                        onTap: ()
                        async{
                          if(_formkey.currentState!.validate()) {
                              await getEmail(current_user_type,idcontroller.text);
                              await LogIn();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: submit_button_color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text("Submit",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Forgot Password ?"),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage(),));
                                },
                                child: Text("Click Here",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }

  Future LogIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: current_user_email,
        password: passwordcontroller.text.trim());
        current_user_enrollmentno=idcontroller.text.trim();
        await getDetails(current_user_type, idcontroller.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }on FirebaseException catch (error){
      setState(() {
        isLoading=false;
        Navigator.of(context).pop;
        errormessage = error.message!;
      });
      print(errormessage);
    }
  }
}

