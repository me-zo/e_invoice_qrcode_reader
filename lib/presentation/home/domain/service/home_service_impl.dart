import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/fixtures/tlv_model_keys.dart';

import '../../../../core/failures/failures.dart';
import '../models/tlv.dart';
import 'home_service.dart';

class HomeServiceImpl implements HomeService {
  @override
  Either<Failure, List<TlvModel>> validateQrCode(String scannedString) {
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

  List<TlvModel> _validateQrCodeStringEncryption(String scannedString) {
    const Base64Decoder b64Decoder = Base64Decoder();
    scannedString = scannedString.trim().replaceAll(RegExp(r"\s+"), "");
    print(scannedString);
    final Uint8List qrCodeAsBytes = b64Decoder.convert(scannedString);
    int start = 0, end = 0, index = 0;
    List<TlvModel> tlvList = [];

    for (int counter = 0; counter < 5; counter++) {
      index = start + 1;
      end = start + qrCodeAsBytes[index] + 2;
      start = index + 1;

      var value = utf8.decode(qrCodeAsBytes.sublist(start, end));
      if (counter > 2) {
        value = value + " SAR";
      }
      tlvList.add(
        TlvModel(
          tag: qrCodeAsBytes[start - 2],
          value: value,
          key: TlvModelKeys.values[counter],
        ),
      );
      start = end;
    }
    return tlvList;
  }
}
