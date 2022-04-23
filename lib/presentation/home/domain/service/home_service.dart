
import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';

import '../../../../core/failures/failures.dart';

abstract class HomeService {
  Either<Failure, InvoiceModel> validateQrCode(String scannedString);
}

