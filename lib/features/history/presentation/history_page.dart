import 'package:e_invoice_qrcode_reader/app/localization/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/app_alert_dialogs.dart';
import 'manager/functions_history.dart';
import 'manager/history_cubit.dart';
import 'screens/invoice_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/HistoryPage";

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with FunctionsHistory {
  @override
  void initState() {
    BlocProvider.of<HistoryCubit>(context).displayInvoiceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: InvoiceList(),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: IconButton(
          onPressed: () {
            AppAlertDialog.confirmationDialog(
              context,
              message: Resources.of(context)
                  .getResource("presentation.history.deleteConfirmMessage"),
              onCancel: () => Navigator.of(context).pop(),
              onNext: () {
                BlocProvider.of<HistoryCubit>(context).clearAll();
                Navigator.of(context).pop();
              },
            );
          },
          icon: const Icon(
            Icons.delete,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
