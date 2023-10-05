import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rov_clone/Utils/Assets.dart';
import 'package:rov_clone/Utils/Utils.dart';
import 'package:rov_clone/ui/enterMobile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const EnterMobileScreen())));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.splashScreenLogo),
            const SizedBox(height: 20,),
            const Text("SAFELY DELIVERING PEOPLE AND PACKAGES",
            style: TextStyle(color: Colors.white, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
