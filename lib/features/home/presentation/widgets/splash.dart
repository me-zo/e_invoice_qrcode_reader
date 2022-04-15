import 'package:flutter/material.dart';

import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //it doesn't matter where we push since we control the base of the route generator
    Future.delayed(const Duration(seconds: 2), () => Navigator.pushReplacementNamed(context, HomePage.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400]!.withOpacity(0.4),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/logo.png",height: 100,),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Mezo\nTechnologies",
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
            ),],
        ),
      ),
    );
  }
}
