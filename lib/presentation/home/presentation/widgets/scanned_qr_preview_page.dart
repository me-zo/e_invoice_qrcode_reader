import '../../../../core/common/app_snack_bar.dart';
import '../manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/tlv.dart';

class ScannedQrPreviewPage extends StatefulWidget {
  const ScannedQrPreviewPage({
    Key? key,
    required this.scannedData,
  }) : super(key: key);
  final String scannedData;

  @override
  State<ScannedQrPreviewPage> createState() => _ScannedQrPreviewPageState();
}

class _ScannedQrPreviewPageState extends State<ScannedQrPreviewPage>
    with AppSnackBar {
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
                        state.message,
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
                            widget.scannedData,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
  final List<TlvModel> info;

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
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0)
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
              if (index == 0)
                const Divider(
                  thickness: 3,
                  color: Colors.black45,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      info[index].key,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    info[index].value,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemCount: info.length,
      ),
    );
  }
}
