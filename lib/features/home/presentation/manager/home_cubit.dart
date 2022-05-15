import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/dependencies.dart';
import 'package:e_invoice_qrcode_reader/core/errors/errors.dart';
import '../../../../core/common/models/invoice_model.dart';
import '../../domain/service/home_service.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService = sl();

  HomeCubit() : super(HomeInitial());

  void validateQrCode({required String scannedString}) {
    emit(Loading());
    var result = _homeService.validateQrCode(scannedString);
    result.fold(
      (l) {
        if(l.failureAction == FailureActions.workAround) {
          log("work around me with some action if you want");
        }
      emit(ShowError(message: l.message));
      },
      (r) => emit(DisplayScannedInfo(info: r)),
    );
  }

  void stopScanner({required String scannedString}) {
    emit(ScanQrCode(scannedString: scannedString));
  }
}
