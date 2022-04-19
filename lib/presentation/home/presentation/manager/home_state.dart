part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ScanQrCode extends HomeState {
  ScanQrCode({required this.scannedString});
  final String scannedString;
}

class ShowError extends HomeState {
  ShowError({required this.message});
  final String message;
}

class Loading extends HomeState {
}

class DisplayScannedInfo extends HomeState {
  DisplayScannedInfo({required this.info});
  final List<TlvModel> info;
}