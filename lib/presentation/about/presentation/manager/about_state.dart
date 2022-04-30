part of 'about_cubit.dart';

@immutable
abstract class AboutState {}

class AboutInitial extends AboutState {}

class ScanQrCode extends AboutState {
  ScanQrCode({required this.scannedString});

  final String scannedString;
}

class ShowError extends AboutState {
  ShowError({required this.message});

  final String message;
}

class Loading extends AboutState {}

class DisplayInvoiceList extends AboutState {
  DisplayInvoiceList({required this.info});

  final InvoiceListModel info;
}
