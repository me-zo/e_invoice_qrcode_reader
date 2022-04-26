import 'package:e_invoice_qrcode_reader/core/common/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_theme/button_styles.dart';
import '../manager/functions_home.dart';
import 'scan_qr_code.dart';

class Home extends StatelessWidget with FunctionsHome {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: _ScanViaCameraAnimatedIcon(),
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

class _ScanViaCameraAnimatedIcon extends StatefulWidget {
  const _ScanViaCameraAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<_ScanViaCameraAnimatedIcon> createState() => _ScanViaCameraAnimatedIconState();
}

class _ScanViaCameraAnimatedIconState extends State<_ScanViaCameraAnimatedIcon>
    with TickerProviderStateMixin {
  static DecorationTween decorationTween(BuildContext context) => DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFF444444),
      borderRadius: BorderRadius.circular(30.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Theme.of(context).colorScheme.background,
          blurRadius: 3.0,
          offset: Offset(-1, -1),
        ),BoxShadow(
          color: Theme.of(context).colorScheme.primary,
          blurRadius: 3.0,
          offset: Offset(3, 3),
        )
      ],
    ),
    end: const BoxDecoration(
      color: Color(0xFF444444),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBoxTransition(
        decoration: decorationTween(context).animate(_controller),
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScanQrCode())),
            icon: Stack(
              children:  [
                const Icon(
                  Icons.qr_code_scanner_outlined,
                  size: 165,
                ),
                Align(
                    child: Icon(Icons.camera, size: 60,color: Colors.yellow[700]),
                    alignment: Alignment.bottomRight),
              ],
            ),
            iconSize: 170,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
