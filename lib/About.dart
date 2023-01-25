import 'package:flutter/material.dart';

import 'PopupButton.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About LDRP-ITR"),
        actions: [
          PopupButton(),
        ],
      ),
      body: Column(
        children: [
          Image(image: AssetImage("assets/images/collage.jpg")),
          SizedBox(height: 15,),
          Text("Welcome to LDRP – ITR (A Constituent College of KSV)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Text("LDRP INSTITUTE OF TECHNOLOGY AND RESEARCH, Gandhinagar was established in 2005 – 2006. The college has made steady progress during the past one year of its existence. Established as a pace setting Institute of Technical Education imparting undergraduate and postgraduate education, it has played a vital role in engineering colleges of Gujarat. In this mission today it has progressed to offering several B.E., M.B.A. and M.C.A. Programs and facilities."),
          Divider(),
          Text("Follow US on"),
          Row(
            children: [
              Container(color:Colors.red,child: Image(image: AssetImage("assets/images/yt.jpg"),height: 80,)),
              Container(color:Colors.green,child: Image(image: AssetImage("assets/images/fb.jpg"),height: 57,)),
              Container(color:Colors.red,child: Image(image: AssetImage("assets/images/tw.jpg"),height: 50,)),
              Container(color:Colors.red,child: Image(image: AssetImage("assets/images/ig.jpg"),height: 48,)),
              Container(color:Colors.red,child: Image(image: AssetImage("assets/images/li.jpg"),height: 47,)),
            ],
          )


        ],
      ),
    );
  }
}
