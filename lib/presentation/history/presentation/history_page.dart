import 'package:e_invoice_qrcode_reader/presentation/history/presentation/manager/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/functions_history.dart';
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
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InvoiceList(),
    );
  }
}
