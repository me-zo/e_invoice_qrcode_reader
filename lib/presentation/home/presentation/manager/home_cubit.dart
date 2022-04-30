import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';
import 'package:e_invoice_qrcode_reader/presentation/home/domain/service/home_service.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService homeService;

  HomeCubit({required this.homeService}) : super(HomeInitial());

  void validateQrCode({required String scannedString}) {
    emit(Loading());
    var result = homeService.validateQrCode(scannedString);
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplayScannedInfo(info: r)),
    );
  }

  void stopScanner({required String scannedString}) {
    emit(ScanQrCode(scannedString: scannedString));
  }
}
