import 'package:flutter/material.dart';

import '../home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/1x/logo.png"), context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage("assets/images/1x/logo.png"),
              height: 95,
              width: 100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Mezo\nTechnologies",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
