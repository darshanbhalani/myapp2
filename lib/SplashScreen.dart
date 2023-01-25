import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/HomePage.dart';
import 'package:myapp2/Login/WelcomeScreen.dart';
import 'VariablesFile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/Login/ForgotPasswordPage.dart';
import 'package:myapp2/VariablesFile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/appicon.jpg')
          ],
        ),
        nextScreen:StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot) {
              if (snapshot.hasData) {
                getLocalDetails();
                return HomePage();
              }
              else {

                return WelcomeScreen();
              }
            }
        ),
      splashIconSize: 300,
      duration: 3000,
    );
  }
}

