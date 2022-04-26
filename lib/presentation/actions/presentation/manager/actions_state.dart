part of 'actions_cubit.dart';

@immutable
abstract class ActionsState {}

class ActionsInitial extends ActionsState {}

class ScanQrCode extends ActionsState {
  ScanQrCode({required this.scannedString});
  final String scannedString;
}

class ShowError extends ActionsState {
  ShowError({required this.message});
  final String message;
}

class Loading extends ActionsState {
}

class DisplayInvoiceList extends ActionsState {
  DisplayInvoiceList({required this.info});
  final InvoiceListModel info;
}