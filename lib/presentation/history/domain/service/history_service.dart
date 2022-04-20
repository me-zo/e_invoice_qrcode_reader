
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../models/tlv.dart';

abstract class HistoryService {
  Either<Failure, List<TlvModel>> validateQrCode(String scannedString);
}

