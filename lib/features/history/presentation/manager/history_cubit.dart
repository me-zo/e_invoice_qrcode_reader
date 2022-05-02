import 'package:bloc/bloc.dart';
import '../../domain/models/invoice_list_model.dart';
import 'package:flutter/material.dart';

import '../../domain/service/history_service.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryService historyService;

  HistoryCubit({required this.historyService}) : super(HistoryInitial());

  void displayInvoiceList() {
    emit(Loading());
    var result = historyService.invoiceList();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplayInvoiceList(info: r)),
    );
  }

  void clearAll() {
    emit(Loading());
    var result = historyService.clearList();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplayInvoiceList(info: InvoiceListModel.empty())),
    );
  }
}
