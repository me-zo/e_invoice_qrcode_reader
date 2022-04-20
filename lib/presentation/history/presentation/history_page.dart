import 'package:flutter/material.dart';

import 'manager/functions_history.dart';
import 'widgets/history_screen.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HistoryPage";

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with FunctionsHistory {
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
            HistoryScreen(),
            Center(child: Text("About Us"),),
          ],
        ),
      ),
    );
  }
}
