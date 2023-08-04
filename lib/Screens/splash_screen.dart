import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furzan_app/Screens/BottomNavigation.dart';
import 'package:furzan_app/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),()async{

     final SharedPreferences prefs = await SharedPreferences.getInstance();
     
     if(prefs.containsKey("Token")){
       Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const BottomNav()));
     }else{
       Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const LoginScreen()));
     }
     
   });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
