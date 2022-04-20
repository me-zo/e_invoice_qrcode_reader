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

class DisplayScannedInfo extends HistoryState {
  DisplayScannedInfo({required this.info});
  final List<TlvModel> info;
}