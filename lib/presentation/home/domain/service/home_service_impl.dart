import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';

import '../../../../core/failures/failures.dart';
import 'home_service.dart';

class HomeServiceImpl implements HomeService {
  @override
  Either<Failure, InvoiceModel> validateQrCode(String scannedString) {
    try {
      return Right(_validateQrCodeStringEncryption(scannedString));
    } catch (e) {
      return Left(
        InvalidScanFailure(
          message: "The Scanned QR Code is not compliant with ZATCA standards",
        ),
      );
    }
  }

  InvoiceModel _validateQrCodeStringEncryption(String scannedString) {
    const Base64Decoder b64Decoder = Base64Decoder();
    scannedString = scannedString.trim().replaceAll(RegExp(r"\s+"), "");
    print(scannedString);
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
  }
}
