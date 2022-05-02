import 'package:dartz/dartz.dart';
import '../models/faqs_list_model.dart';
import '../models/settings_model.dart';

import '../../../../core/failures/failure.dart';

abstract class ActionsService {
  Either<Failure, SettingsModel> loadSettings();

  Either<Failure, FaqsListModel> loadFaqs();

  Either<Failure, void> changeLanguage({required String language});

  Either<Failure, void> changeTheme({required String theme});
}
