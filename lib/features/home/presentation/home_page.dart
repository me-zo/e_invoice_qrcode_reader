import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../about/presentation/about_page.dart';
import '../../actions/presentation/actions_page.dart';
import '../../history/presentation/history_page.dart';
import 'manager/functions_home.dart';
import 'manager/home_cubit.dart';
import 'screens/home.dart';
import 'screens/scanned_qr_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FunctionsHome {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ScanQrCode) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  ScannedQrPreview(scannedData: state.scannedString),
            ),
          );
        }
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ActionsPage(
                          action: ActionName.faqs,
                        ),
                      ),
                    ),
                icon: const Icon(
                  Icons.contact_support,
                )),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.history)),
                Tab(icon: Icon(Icons.qr_code_scanner)),
                Tab(icon: Icon(Icons.info_outline)),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ActionsPage(
                            action: ActionName.settings,
                          ),
                        ),
                      ),
                  icon: const Icon(
                    Icons.settings,
                  ))
            ],
          ),
          body: const TabBarView(
            children: [
              HistoryPage(),
              Home(),
              AboutPage(),
            ],
          ),
        ),
      ),
    );
  }
}
