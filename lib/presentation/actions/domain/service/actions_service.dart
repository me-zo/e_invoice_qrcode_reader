import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

abstract class ActionsService {
  Either<Failure, void> loadSettings();

  Either<Failure, void> changeLanguage();

  Either<Failure, void> changeTheme();
}
