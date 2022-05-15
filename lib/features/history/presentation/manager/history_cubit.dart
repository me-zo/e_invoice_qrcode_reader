import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/dependencies.dart';
import 'package:flutter/material.dart';

import '../../domain/models/invoice_list_model.dart';
import '../../domain/service/history_service.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryService _historyService = sl();

  HistoryCubit() : super(HistoryInitial());

  void displayInvoiceList() {
    emit(Loading());
    var result = _historyService.invoiceList();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplayInvoiceList(info: r)),
    );
  }

  void clearAll() {
    emit(Loading());
    var result = _historyService.clearList();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplayInvoiceList(info: InvoiceListModel.empty())),
    );
  }
}
