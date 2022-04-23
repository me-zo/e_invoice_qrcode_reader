import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/presentation/history/domain/models/invoice_list_model.dart';

import '../../../../core/failures/failures.dart';

abstract class HistoryService {
  Either<Failure, InvoiceListModel> invoiceList();
}
