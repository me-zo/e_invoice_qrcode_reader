part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class ScanQrCode extends HistoryState {
  ScanQrCode({required this.scannedString});
  final String scannedString;
}

class ShowError extends HistoryState {
  ShowError({required this.message});
  final String message;
}

class Loading extends HistoryState {
}

class DisplayInvoiceList extends HistoryState {
  DisplayInvoiceList({required this.info});
  final InvoiceListModel info;
}