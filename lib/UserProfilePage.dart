import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/Login/LoginChoisePage.dart';
import 'package:myapp2/Login/WelcomeScreen.dart';
import 'package:myapp2/main.dart';
import 'Login/LoginPage.dart';
import 'NotificationIcon.dart';
import 'PopupButton.dart';
import 'SideMenu.dart';
import 'VariablesFile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  void _logout(context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout,color: Colors.white,size: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text("Sign Out",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                )
              ],
            ),
            content: Text("Do You want to Sign Out ?",style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("No")
              ),
              TextButton(
                  onPressed: ()async{
                  //   showDialog(
                  //       context: context,
                  //       builder: (context){
                  //         return Center(child: CircularProgressIndicator());
                  //       }
                  //   );

                    // while(Navigator.canPop(context)){
                    //   Navigator.pop(context);
                    // }
                     await FirebaseAuth.instance.signOut().then((value) async{
                       await removeLocalDetails();
                       Navigator.popUntil(context, (route) => false);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginChoisePage()));
                     });
                  },
                  child: Text("Yes")
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          NotificationIcon(),
          PopupButton(),
        ],
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/asd.jpg"),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 30,
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => Container(
                              height: 120,
                              color: Colors.grey,
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Choose Profile Photo",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(onPressed:(){}, icon: Icon(Icons.camera),),
                                      IconButton(onPressed:(){}, icon: Icon(Icons.upload),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.blueAccent,
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text(current_user_type+" Id",style: TextStyle(fontSize: 15,)),
            SizedBox(height: 5,),
            TextFormField(
              enabled: false,
              readOnly: true,
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
                labelText: current_user_enrollmentno,
                labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Text("Name",style: TextStyle(fontSize: 15,)),
            SizedBox(height: 5,),
            TextFormField(
              enabled: false,
              readOnly: true,
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
                labelText: current_user_name,
                labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: current_user_type=="Student",
              child: Container(
                child: Column(
                    children:[
                      Padding(
                    padding: EdgeInsets.only(right: 325),
                    child: Text("Branch",style: TextStyle(fontSize: 15,)),
                  ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_branch,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(right: 334),
                        child: Text("Class",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_class,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(right: 308),
                        child: Text("Semester",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_sem,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(right: 334),
                        child: Text("Year",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_year,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(right: 323),
                        child: Text("Validity",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_validity,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ] ),
              ),
            ),
            Visibility(
                visible: current_user_type=="Teacher",
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 290),
                        child: Text("Department",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_department,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(right: 288),
                        child: Text("Joining Date",style: TextStyle(fontSize: 15,)),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        enabled: false,
                        readOnly: true,
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
                          labelText: current_user_joining_date,
                          labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                )
            ),
            Text("Phone no.",style: TextStyle(fontSize: 15,)),
            SizedBox(height: 5,),
            TextFormField(
              enabled: false,
              readOnly: true,
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
                labelText: current_user_phoneno,
                labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Text("Email",style: TextStyle(fontSize: 15,)),
            SizedBox(height: 5,),
            TextFormField(
              enabled: false,
              readOnly: true,
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
                labelText: current_user_email,
                labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text("Sign Out",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  onPressed: ()async{
                    _logout(context);
                    // await
                    // FirebaseAuth.instance.signOut().then((value) => MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
