import '../../../../app/app_theme/button_styles.dart';
import 'package:flutter/material.dart';

import '../manager/functions_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with FunctionsHistory {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const _ScanViaCameraIcon(),
          iconSize: 170,
          color: Colors.white.withOpacity(0.3),
        ),
        const _OrDividerWidget(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ButtonStyles.primary(),
            onPressed: () {},
            child: Text(
              "Scan From Gallery".toUpperCase(),
            ),
          ),
        ),
      ],
    ));
  }
}

class _OrDividerWidget extends StatelessWidget {
  const _OrDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(
          child: Divider(
            color: Colors.white,
          ),
          width: 60,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          child: Divider(
            color: Colors.white,
          ),
          width: 60,
        ),
      ],
    );
  }
}

class _ScanViaCameraIcon extends StatelessWidget {
  const _ScanViaCameraIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Icon(
          Icons.qr_code_scanner_outlined,
          size: 165,
        ),
        Align(
            child: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
            alignment: Alignment.bottomRight),
      ],
    );
  }
}
