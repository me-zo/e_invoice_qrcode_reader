import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';
import 'package:e_invoice_qrcode_reader/core/helpers/common_helper.dart';
import 'package:e_invoice_qrcode_reader/presentation/history/domain/models/invoice_list_model.dart';

import '../../../../core/failures/failures.dart';
import 'history_service.dart';

class HistoryServiceImpl implements HistoryService {
  @override
  Either<Failure, InvoiceListModel> invoiceList() {
    try {
      InvoiceListModel invoices = InvoiceListModel(invoices: [
        InvoiceModel(
          sellerName: "sellerName",
          sellerTaxNumber: "sellerTaxNumber",
          invoiceDate: "invoiceDate",
          invoiceTotal: "invoiceTotal",
          taxTotal: "taxTotal",
          scannedDate: DateTime.now(),
        ),InvoiceModel(
          sellerName: "sellerName",
          sellerTaxNumber: "sellerTaxNumber",
          invoiceDate: "invoiceDate",
          invoiceTotal: "invoiceTotal",
          taxTotal: "taxTotal",
          scannedDate: DateTime.now(),
        ),InvoiceModel(
          sellerName: "sellerName",
          sellerTaxNumber: "sellerTaxNumber",
          invoiceDate: "invoiceDate",
          invoiceTotal: "invoiceTotal",
          taxTotal: "taxTotal",
          scannedDate: CommonHelper.emptyDate,
        ),InvoiceModel(
          sellerName: "sellerName",
          sellerTaxNumber: "sellerTaxNumber",
          invoiceDate: "invoiceDate",
          invoiceTotal: "invoiceTotal",
          taxTotal: "taxTotal",
          scannedDate: DateTime.now(),
        ),InvoiceModel(
          sellerName: "sellerName",
          sellerTaxNumber: "sellerTaxNumber",
          invoiceDate: "invoiceDate",
          invoiceTotal: "invoiceTotal",
          taxTotal: "taxTotal",
          scannedDate: CommonHelper.emptyDate,
        )
      ]);
      return Right(invoices);
    } catch (e) {
      return Left(
        InvalidScanFailure(
          message: "The Scanned QR Code is not compliant with ZATCA standards",
        ),
      );
    }
  }
}
