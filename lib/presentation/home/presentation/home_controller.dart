import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/functions_home.dart';
import 'manager/home_cubit.dart';
import 'widgets/home_page.dart';

class HomeController extends StatefulWidget {
  const HomeController({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HomePage";

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> with FunctionsHome {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.contact_support)),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.history)),
              Tab(icon: Icon(Icons.qr_code_scanner)),
              Tab(icon: Icon(Icons.info_outline)),
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
          ],
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("History"),),
            HomePage(),
            Center(child: Text("About Us"),),
          ],
        ),
      ),
    );
  }
}
