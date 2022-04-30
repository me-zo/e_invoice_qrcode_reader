import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';

abstract class AboutService {
  Either<Failure, void> loadSettings();

  Either<Failure, void> changeLanguage();

  Either<Failure, void> changeTheme();
}
