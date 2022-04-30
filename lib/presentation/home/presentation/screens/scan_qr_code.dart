import 'package:e_invoice_qrcode_reader/presentation/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                            iconSize: 40,
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            icon: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder:
                                  (context, AsyncSnapshot<bool?> snapshot) {
                                if (snapshot.data ?? false) {
                                  return Icon(Icons.flash_off,color: Theme.of(context).colorScheme.tertiary,);
                                } else {
                                  return Icon(Icons.flash_on,color: Theme.of(context).colorScheme.tertiary,);
                                }
                              },
                            )),
                      ),
                      _buildCameraButton(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildCameraButton() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: IconButton(
          iconSize: 40,
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {});
          },
          icon: FutureBuilder(
            future: controller?.getCameraInfo(),
            builder: (context, AsyncSnapshot<CameraFacing> snapshot) {
              if (snapshot.data != null) {
                switch (snapshot.data) {
                  case CameraFacing.front:
                    return Icon(Icons.camera_rear,color: Theme.of(context).colorScheme.tertiary,);
                  case CameraFacing.back:
                    return Icon(Icons.camera_front,color: Theme.of(context).colorScheme.tertiary,);
                  default:
                    return Icon(Icons.camera,color: Theme.of(context).colorScheme.tertiary,);
                }
              } else {
                return Icon(Icons.camera,color: Theme.of(context).colorScheme.tertiary,);
              }
            },
          )),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result != null) {
        controller.pauseCamera();
        controller.stopCamera();
        Future.delayed(Duration.zero, () {
          BlocProvider.of<HomeCubit>(context).stopScanner(
            scannedString: result!.code ?? "",
          );
        });
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
