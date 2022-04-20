import 'package:bloc/bloc.dart';
import '../../../home/domain/models/tlv.dart';
import 'package:flutter/material.dart';

import '../../domain/service/history_service.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryService historyService;

  HistoryCubit({required this.historyService}) : super(HistoryInitial());

  void validateQrCode({required String scannedString}) {
    emit(Loading());
    var result = historyService.validateQrCode(scannedString);
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) {},
    );
  }
}
