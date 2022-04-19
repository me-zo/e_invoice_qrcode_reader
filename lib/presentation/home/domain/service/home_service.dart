
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../models/tlv.dart';

abstract class HomeService {
  Either<Failure, List<TlvModel>> validateQrCode(String scannedString);
}

