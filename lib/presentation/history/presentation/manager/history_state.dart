part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class ShowError extends HistoryState {
  ShowError({required this.message});

  final String message;
}

class Loading extends HistoryState {}

class DisplayInvoiceList extends HistoryState {
  DisplayInvoiceList({required this.info});

  final InvoiceListModel info;
}
