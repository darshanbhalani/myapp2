import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp2/HomePage-Loading.dart';
import 'package:myapp2/HomePage.dart';
import 'package:myapp2/HomeScreen.dart';
import 'package:myapp2/SplashScreen.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
      home: SplashScreen(),
  )
  );
}
