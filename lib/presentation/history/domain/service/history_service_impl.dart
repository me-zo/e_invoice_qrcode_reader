import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';
import 'package:e_invoice_qrcode_reader/core/exports.dart';
import 'package:e_invoice_qrcode_reader/data/entities/invoice_entity.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/invoice/invoice_repository.dart';
import 'package:e_invoice_qrcode_reader/presentation/history/domain/models/invoice_list_model.dart';

import 'history_service.dart';

class HistoryServiceImpl implements HistoryService {
  final InvoiceRepository invoiceRepository;

  HistoryServiceImpl({required this.invoiceRepository});

  @override
  Either<Failure, InvoiceListModel> invoiceList() =>
      FailureHandler.handleFunction<List<InvoiceEntity>>(
        () => invoiceRepository.getAll(),
        "The Scanned QR Code is not compliant with ZATCA standards",
      ).fold(
        (l) => Left(l),
        (r) {
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
  Either<Failure, void> clearList() => FailureHandler.handleFunction<void>(
        () => invoiceRepository.getAll(),
        "The Scanned QR Code is not compliant with ZATCA standards",
      ).fold(
        (l) => Left(l),
        (r) {
          invoiceRepository.deleteAll();
          return const Right(null);
        },
      );
}
