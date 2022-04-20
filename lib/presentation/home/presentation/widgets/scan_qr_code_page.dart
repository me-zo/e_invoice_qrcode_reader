import 'scanned_qr_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
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
                  if (result != null)
                    Builder(
                      builder: (BuildContext context) {
                        controller!.stopCamera();
                        Future.delayed(Duration.zero,
                          () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ScannedQrPreviewPage(
                                  scannedData: result!.code ?? ""),
                            ),
                          ),
                        );
                        return const Text('Scan a code');
                      },
                    )
                  else
                    const Text('Scan a code'),
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
                              builder: (context, AsyncSnapshot<bool?> snapshot) {
                                if(snapshot.data ?? false) {
                                  return const Icon(Icons.flash_off);
                                } else {
                                  return const Icon(Icons.flash_on);
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
                    return const Icon(Icons.camera_rear);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_front);
                  default:
                    return const Icon(Icons.camera);
                }
              } else {
                return const Icon(Icons.camera);
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
      setState(() {
        result = scanData;
      });
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
