import 'package:flutter/material.dart';

class UnImplementedPage extends StatelessWidget {
  const UnImplementedPage({Key? key}) : super(key: key);

  static const routeName = "/unimplemented_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Text("This Feature is not implemented." ),
          ],
        ),
      ),
    );
  }
}
