

import 'dart:async';

import 'package:expense_app/data/local_database/db_helper.dart';
import 'package:expense_app/screens/expense_home_page.dart';
import 'package:expense_app/screens/login_page.dart';
import 'package:expense_app/screens/sign_up_page.dart';
import 'package:expense_app/screens/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen>{
   SharedPreferences? prefs;
   int? uId;
  @override
  void initState() {
    movePage();
    super.initState();
  }
  Widget page = ExpenseHomePage() ;
  void movePage() async{
    prefs = await SharedPreferences.getInstance();
    uId = prefs!.getInt(DbHelper.PREFERS_UID);
    if(uId == null || uId == 0 ){
    page = TutorialPage();
    }
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple.shade50,Colors.purple.shade50,])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/brand_logo.png',),
            Text('Monety',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)
          ],
        ),
      )
    );
  }
}