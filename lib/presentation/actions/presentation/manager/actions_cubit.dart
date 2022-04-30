import 'package:bloc/bloc.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/faqs_list_model.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/settings_model.dart';
import 'package:flutter/material.dart';

import '../../domain/service/actions_service.dart';

part 'actions_state.dart';

class ActionsCubit extends Cubit<ActionsState> {
  final ActionsService actionsService;

  ActionsCubit({required this.actionsService}) : super(ActionsInitial());

  SettingsModel settingsModel = SettingsModel.empty();
  String selectedLanguage = "";
  String selectedTheme = "";

  void prepareSettings() {
    emit(Loading());
    var result = actionsService.loadSettings();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) {
        settingsModel = r;
        selectedLanguage = r.local;
        selectedTheme = r.theme;
        emit(DisplaySettings(info: r));
      },
    );
  }

  void prepareFaqs() {
    emit(Loading());
    var result = actionsService.loadFaqs();
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) {
        emit(DisplayFaqs(info: r));
      },
    );
  }

  void changeTheme(String theme) {
    var result = actionsService.changeTheme(theme: theme);
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplaySettings(info: settingsModel)),
    );
  }

  void changeLanguage(String language) {
    var result = actionsService.changeLanguage(language: language);
    result.fold(
      (l) => emit(ShowError(message: l.message)),
      (r) => emit(DisplaySettings(info: settingsModel)),
    );
  }
}
