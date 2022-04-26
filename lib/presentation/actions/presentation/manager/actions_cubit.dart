import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/presentation/history/domain/models/invoice_list_model.dart';
import 'package:flutter/material.dart';

import '../../domain/service/actions_service.dart';

part 'actions_state.dart';

class ActionsCubit extends Cubit<ActionsState> {
  final ActionsService actionsService;

  ActionsCubit({required this.actionsService}) : super(ActionsInitial());

  void prepareSettings() {
    emit(Loading());
    var result = actionsService.loadSettings();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(Loading()),
    );
  }
  void changeTheme() {
    emit(Loading());
    var result = actionsService.changeTheme();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(Loading()),
    );
  }
}
