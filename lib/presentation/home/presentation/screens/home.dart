import 'package:e_invoice_qrcode_reader/core/common/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_theme/button_styles.dart';
import '../manager/functions_home.dart';
import 'scan_qr_code.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with FunctionsHome {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ScanQrCode())),
          icon: const _ScanViaCameraIcon(),
          iconSize: 170,
          color: Colors.white.withOpacity(0.3),
        ),
        const _OrDividerWidget(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ButtonStyles.primary(),
            onPressed: () {
              AppSnackBar.errorSnackBar(context,message: "Sorry! This Feature Is not supported yet.");
            },
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
            thickness: 3,
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
            thickness: 3,
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
