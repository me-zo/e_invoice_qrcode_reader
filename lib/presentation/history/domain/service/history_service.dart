import 'package:dartz/dartz.dart';
import '../models/invoice_list_model.dart';

import '../../../../core/failures/failure.dart';

abstract class HistoryService {
  Either<Failure, InvoiceListModel> invoiceList();

  Either<Failure, void> clearList();
}
