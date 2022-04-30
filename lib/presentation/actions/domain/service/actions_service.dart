import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/faqs_list_model.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/settings_model.dart';

import '../../../../core/failures/failure.dart';

abstract class ActionsService {
  Either<Failure, SettingsModel> loadSettings();
  Either<Failure, FaqsListModel> loadFaqs();

  Either<Failure, void> changeLanguage({required String language});

  Either<Failure, void> changeTheme({required String theme});
}
