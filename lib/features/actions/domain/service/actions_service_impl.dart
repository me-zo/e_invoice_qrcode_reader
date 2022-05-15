import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/dependencies.dart';
import 'package:e_invoice_qrcode_reader/data/shared_preferences/settings_notifier.dart';

import '../../../../core/exports.dart';
import '../models/faqs_list_model.dart';
import '../models/settings_model.dart';
import 'actions_service.dart';

class ActionsServiceImpl implements ActionsService {
  final SettingsNotifier _settingsNotifier = sl();

  @override
  Either<Failure, SettingsModel> loadSettings() =>
      ErrorHandler.handle<SettingsModel>(
        () => Right(
          SettingsModel(
              local: _settingsNotifier.getLocale.languageCode,
              theme: _settingsNotifier.getThemeName),
        ),
      );

  @override
  Either<Failure, void> changeLanguage({required String language}) =>
      ErrorHandler.handle<void>(
        () {
          _settingsNotifier.setLocale(language);
          return const Right(null);
        },
      );

  @override
  Either<Failure, void> changeTheme({required String theme}) =>
      ErrorHandler.handle<void>(
        () {
          _settingsNotifier.setTheme(theme);
          return const Right(null);
        },
      );

  @override
  Either<Failure, FaqsListModel> loadFaqs() =>
      ErrorHandler.handle<FaqsListModel>(
        () {
          return Right(FaqsListModel(questions: [
            FaqsQuestionModel(
                title: "presentation.actions.faqsQuestion1Title",
                answer: "presentation.actions.faqsQuestion1Body"),
            FaqsQuestionModel(
                title: "presentation.actions.faqsQuestion2Title",
                answer: "presentation.actions.faqsQuestion2Body"),
          ]));
        },
      );
}
