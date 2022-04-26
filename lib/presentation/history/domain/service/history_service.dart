import 'package:dartz/dartz.dart';
import '../models/invoice_list_model.dart';

import '../../../../core/failures/failures.dart';

abstract class HistoryService {
  Either<Failure, InvoiceListModel> invoiceList();

  Either<Failure, void> clearList();
}
