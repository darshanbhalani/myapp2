import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/HomeScreen.dart';
import 'package:myapp2/Temp.dart';
import 'package:shimmer/shimmer.dart';

import 'NotificationIcon.dart';
import 'PopupButton.dart';
import 'SideMenu.dart';
import 'VariablesFile.dart';

class HomePageLoading extends StatefulWidget {
  const HomePageLoading({Key? key}) : super(key: key);

  @override
  State<HomePageLoading> createState() => _HomePageLoadingState();
}

class _HomePageLoadingState extends State<HomePageLoading> {

  void initState(){
    super.initState();

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageLoading()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child:ListView.separated(
            itemBuilder: (context,index){
              isHomeScreenLoaded=true;
              return InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context,index){return SizedBox(height: 0,);},
            itemCount: 15
        ),
        baseColor: CupertinoColors.systemGrey2,
        highlightColor: Colors.white60,
      );
  }
}
