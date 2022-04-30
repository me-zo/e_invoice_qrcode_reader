import 'package:e_invoice_qrcode_reader/app/localization/resources.dart';
import 'package:e_invoice_qrcode_reader/core/common/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_theme/styles/button_styles.dart';
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
        const _ScanViaCameraAnimatedIcon(),
        const Padding(
          padding: EdgeInsets.all(20),
          child: _OrDividerWidget(),
        ),
        ElevatedButton(
          style: ButtonStyles.primary(Theme.of(context).colorScheme),
          onPressed: () {
            AppSnackBar.notificationSnackBar(context,
                message: Resources.of(context).getResource(
                    "presentation.home.featureNotSupportedMessage"));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: Text( Resources.of(context).getResource(
                "presentation.home.scanFromGallery").toUpperCase(),
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
      children: [
        const SizedBox(
          child: Divider(
            thickness: 3,
          ),
          width: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            Resources.of(context).getResource("presentation.home.or").toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          child: Divider(
            thickness: 3,
          ),
          width: 80,
        ),
      ],
    );
  }
}

class _ScanViaCameraAnimatedIcon extends StatefulWidget {
  const _ScanViaCameraAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<_ScanViaCameraAnimatedIcon> createState() =>
      _ScanViaCameraAnimatedIconState();
}

class _ScanViaCameraAnimatedIconState extends State<_ScanViaCameraAnimatedIcon>
    with TickerProviderStateMixin {
  static DecorationTween decorationTween(BuildContext context) =>
      DecorationTween(
        begin: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.surface,
              blurRadius: 3.0,
              offset: const Offset(-6, -6),
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 3.0,
              offset: const Offset(4, 4),
            )
          ],
        ),
        end: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
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
              MaterialPageRoute(
                builder: (context) => const ScanQrCode(),
              ),
            ),
            icon: Stack(
              children: [
                Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  size: 165,
                ),
                Align(
                    child:
                        Icon(Icons.camera, size: 60, color: Colors.yellow[700]),
                    alignment: Alignment.bottomRight),
              ],
            ),
            iconSize: 170,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
