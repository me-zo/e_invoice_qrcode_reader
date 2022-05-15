import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/dependencies.dart';
import 'package:e_invoice_qrcode_reader/core/exports.dart';
import 'package:e_invoice_qrcode_reader/data/entities/invoice_entity.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/invoice/invoice_repository.dart';

import 'home_service.dart';

class HomeServiceImpl implements HomeService {
  final InvoiceRepository _invoiceRepository = sl();

  @override
  Either<Failure, InvoiceModel> validateQrCode(String scannedString) =>
      ErrorHandler.handle<InvoiceModel>(
        () {
          var scannedInvoice = _validateQrCodeStringEncryption(scannedString);
          _invoiceRepository.insert(
            invoiceEntity: InvoiceEntity(
              sellerName: scannedInvoice.sellerName,
              sellerTaxNumber: scannedInvoice.sellerTaxNumber,
              invoiceDate: scannedInvoice.invoiceDate,
              invoiceTotal: scannedInvoice.invoiceTotal,
              taxTotal: scannedInvoice.taxTotal,
              scannedDate: scannedInvoice.scannedDate,
            ),
          );
          return Right(scannedInvoice);
        },
      );

  InvoiceModel _validateQrCodeStringEncryption(String scannedString) {
    try {
      const Base64Decoder b64Decoder = Base64Decoder();
      scannedString = scannedString.trim().replaceAll(RegExp(r"\s+"), "");
      final Uint8List qrCodeAsBytes = b64Decoder.convert(scannedString);
      int start = 0, end = 0, index = 0;
      InvoiceModel scannedInvoice = InvoiceModel.empty();
      for (int counter = 0; counter < 5; counter++) {
        index = start + 1;
        end = start + qrCodeAsBytes[index] + 2;
        start = index + 1;

        var value = utf8.decode(qrCodeAsBytes.sublist(start, end));
        if (counter > 2) {
          value = value + " SAR";
        }
        if (counter == 0) {
          scannedInvoice = scannedInvoice.copyWith(sellerName: value);
        }
        if (counter == 1) {
          scannedInvoice = scannedInvoice.copyWith(sellerTaxNumber: value);
        }
        if (counter == 2) {
          scannedInvoice = scannedInvoice.copyWith(invoiceDate: value);
        }
        if (counter == 3) {
          scannedInvoice = scannedInvoice.copyWith(invoiceTotal: value);
        }
        if (counter == 4) {
          scannedInvoice = scannedInvoice.copyWith(taxTotal: value);
        }
        start = end;
      }
      return scannedInvoice;
    } catch (e) {
      throw InvalidQrCodeException("presentation.home.invalidScanError");
    }
  }
}
