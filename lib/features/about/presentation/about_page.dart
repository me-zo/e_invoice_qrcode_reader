import 'package:flutter/material.dart';

import 'manager/functions_about.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/AboutPage";

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with FunctionsAbout {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("About us"),
    );
  }
}
