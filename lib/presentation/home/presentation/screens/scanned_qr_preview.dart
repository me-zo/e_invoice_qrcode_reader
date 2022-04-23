import 'package:e_invoice_qrcode_reader/core/common/widgets/scanned_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/models/invoice_model.dart';
import '../../../../core/common/widgets/app_snack_bar.dart';
import '../manager/home_cubit.dart';

class ScannedQrPreview extends StatefulWidget {
  const ScannedQrPreview({
    Key? key,
    required this.scannedData,
  }) : super(key: key);
  final String scannedData;

  @override
  State<ScannedQrPreview> createState() => _ScannedQrPreviewState();
}

class _ScannedQrPreviewState extends State<ScannedQrPreview> with AppSnackBar {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).validateQrCode(
      scannedString: widget.scannedData,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Result")),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is DisplayScannedInfo) {
              return Column(
                children: [
                  _ScannedDetailsCard(info: state.info),
                ],
              );
            } else if (state is ShowError) {
              return _WrongScannedInfo(
                scannedData: widget.scannedData,
                errorMessage: state.message,
              );
            } else {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade700),
                  child: const Text(
                    "ERROR HAPPENED",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _ScannedDetailsCard extends StatelessWidget {
  final InvoiceModel info;

  const _ScannedDetailsCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade700),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.list_alt),
              ),
              Expanded(
                child: Text(
                  "Invoice Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(thickness: 3, color: Colors.black45),
          ScannedDetailsCardWidget(info: info),
        ],
      ),
    );
  }
}

class _WrongScannedInfo extends StatelessWidget {
  const _WrongScannedInfo({
    Key? key,
    required this.scannedData,
    required this.errorMessage,
  }) : super(key: key);

  final String scannedData, errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade700,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "QR Code Data:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  scannedData,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
