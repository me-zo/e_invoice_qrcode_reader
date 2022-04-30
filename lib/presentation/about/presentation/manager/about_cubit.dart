import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/presentation/history/domain/models/invoice_list_model.dart';
import 'package:flutter/material.dart';

import '../../domain/service/about_service.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final AboutService aboutService;

  AboutCubit({required this.aboutService}) : super(AboutInitial());

  void prepareSettings() {
    emit(Loading());
    var result = aboutService.loadSettings();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(Loading()),
    );
  }

  void changeTheme() {
    emit(Loading());
    var result = aboutService.changeTheme();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(Loading()),
    );
  }
}
