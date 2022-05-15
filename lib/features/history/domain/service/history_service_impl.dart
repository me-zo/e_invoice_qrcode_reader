import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/dependencies.dart';

import '../../../../core/common/models/invoice_model.dart';
import '../../../../core/exports.dart';
import '../../../../data/repositories/invoice/invoice_repository.dart';
import '../models/invoice_list_model.dart';
import 'history_service.dart';

class HistoryServiceImpl implements HistoryService {
  final InvoiceRepository _invoiceRepository = sl();

  @override
  Either<Failure, InvoiceListModel> invoiceList() =>
      ErrorHandler.handle<InvoiceListModel>(
        () {
          var r = _invoiceRepository.getAll();
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
      );

  @override
  Either<Failure, void> clearList() => ErrorHandler.handle<void>(
        () => Right(_invoiceRepository.deleteAll()),
      );
}
