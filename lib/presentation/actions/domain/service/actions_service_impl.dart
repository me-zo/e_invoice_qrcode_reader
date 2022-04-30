import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/data/shared_preferences/settings_notifier.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/faqs_list_model.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/settings_model.dart';

import '../../../../core/exports.dart';
import 'actions_service.dart';

class ActionsServiceImpl implements ActionsService {
  final SettingsNotifier settingsNotifier;

  ActionsServiceImpl({required this.settingsNotifier});

  @override
  Either<Failure, SettingsModel> loadSettings() =>
      FailureHandler.handleEither<SettingsModel>(
        () => Right(SettingsModel(
            local: settingsNotifier.getLocale.languageCode,
            theme: settingsNotifier.getThemeName)),
        "Error Loading Settings",
      );

  @override
  Either<Failure, void> changeLanguage({required String language}) =>
      FailureHandler.handleEither<void>(
        () {
          settingsNotifier.setLocale(language);
          return const Right(null);
        },
        "Error Changing App Language",
      );

  @override
  Either<Failure, void> changeTheme({required String theme}) =>
      FailureHandler.handleEither<void>(
        () {
          settingsNotifier.setTheme(theme);
          return const Right(null);
        },
        "Error Changing App Theme",
      );

  @override
  Either<Failure, FaqsListModel> loadFaqs() =>
      FailureHandler.handleEither<FaqsListModel>(
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
        "Error Changing App Theme",
      );
}
