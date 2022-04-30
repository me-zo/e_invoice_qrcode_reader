import 'package:dartz/dartz.dart';
import '../../../../core/common/models/invoice_model.dart';
import '../../../../core/exports.dart';
import '../../../../data/repositories/invoice/invoice_repository.dart';
import '../models/invoice_list_model.dart';

import 'history_service.dart';

class HistoryServiceImpl implements HistoryService {
  final InvoiceRepository invoiceRepository;

  HistoryServiceImpl({required this.invoiceRepository});

  @override
  Either<Failure, InvoiceListModel> invoiceList() =>
      FailureHandler.handleEither<InvoiceListModel>(
        () {
          var r = invoiceRepository.getAll();
          InvoiceListModel invoices = InvoiceListModel(
            invoices: List.generate(
              r.length,
                  (index) => InvoiceModel(
                sellerName: r[index].sellerName,
                sellerTaxNumber: r[index].sellerTaxNumber,
                invoiceDate: r[index].invoiceDate,
                invoiceTotal: r[index].invoiceTotal,
                taxTotal: r[index].taxTotal,
                scannedDate: r[index].scannedDate,
              ),
            ),
          );
          return Right(invoices);
        },
        "An error happened while fetching the history",
      );

  @override
  Either<Failure, void> clearList() => FailureHandler.handleEither<void>(
        () => Right(invoiceRepository.deleteAll()),
        "An Error happened when clearing history",
      );
}
