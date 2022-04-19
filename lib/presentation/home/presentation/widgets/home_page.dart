import 'package:e_invoice_qrcode_reader/app/app_theme/button_styles.dart';
import 'package:e_invoice_qrcode_reader/presentation/home/presentation/widgets/scan_qr_code_page.dart';
import 'package:flutter/material.dart';

import '../manager/functions_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FunctionsHome {
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
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ScanQrCodePage())),
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
