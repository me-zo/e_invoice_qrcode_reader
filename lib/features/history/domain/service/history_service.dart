import 'package:dartz/dartz.dart';

import '../../../../core/exports.dart';
import '../models/invoice_list_model.dart';

abstract class HistoryService {
  Either<Failure, InvoiceListModel> invoiceList();

  Either<Failure, void> clearList();
}
