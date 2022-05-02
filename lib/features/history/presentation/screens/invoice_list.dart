import 'package:e_invoice_qrcode_reader/app/localization/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/scanned_details_card.dart';
import '../manager/functions_history.dart';
import '../manager/history_cubit.dart';

class InvoiceList extends StatelessWidget with FunctionsHistory {
  const InvoiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is DisplayInvoiceList) {
          return state.info.invoices.isEmpty
              ? Center(
                  child: Text(
                      Resources.of(context)
                          .getResource("presentation.history.emptyHistory"),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                )
              : ListView.separated(
                  itemCount: state.info.invoices.length,
                  separatorBuilder: (context, index) {
                    // if (state.info.invoices[index].scannedDate.day.isEven) {
                    //   return _DateDivider(
                    //     date: state.info.invoices[index].scannedDate,
                    //   );
                    // } else {
                    return const Divider(thickness: 2);
                    //}
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 3,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          BoxShadow(
                            offset: const Offset(-2, -2),
                            blurRadius: 3,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ],
                        color: Theme.of(context).cardColor,
                      ),
                      child: ScannedDetailsCardWidget(
                        info: state.info.invoices[index],
                      ),
                    );
                  },
                );
        } else {
          return const Center(
            child: Text("Error Happened"),
          );
        }
      },
    );
  }
}

// class _DateDivider extends StatelessWidget {
//   const _DateDivider({Key? key, required this.date}) : super(key: key);
//   final DateTime date;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Expanded(
//             flex: 1,
//             child: Divider(
//               thickness: 2,
//             )),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//           child: Text(
//             CommonHelper.formatDate(date: date, withTime: true),
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//         const Expanded(flex: 10, child: Divider(thickness: 2)),
//       ],
//     );
//   }
// }
