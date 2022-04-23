import 'package:e_invoice_qrcode_reader/core/helpers/common_helper.dart';

class InvoiceModel {
  String sellerName;
  String sellerTaxNumber;
  String invoiceDate;
  String invoiceTotal;
  String taxTotal;
  DateTime scannedDate;

  InvoiceModel({
    required this.sellerName,
    required this.sellerTaxNumber,
    required this.invoiceDate,
    required this.invoiceTotal,
    required this.taxTotal,
    required this.scannedDate,
  });

  InvoiceModel copyWith({
    String? sellerName,
    String? sellerTaxNumber,
    String? invoiceDate,
    String? invoiceTotal,
    String? taxTotal,
    DateTime? scannedDate,
  }) {
    return InvoiceModel(
      sellerName: sellerName ?? this.sellerName,
      sellerTaxNumber: sellerTaxNumber ?? this.sellerTaxNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      invoiceTotal: invoiceTotal ?? this.invoiceTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      scannedDate: scannedDate ?? this.scannedDate,
    );
  }
  factory InvoiceModel.empty() {
    return InvoiceModel(
      sellerName: "",
      sellerTaxNumber: "",
      invoiceDate: "",
      invoiceTotal: "",
      taxTotal: "",
      scannedDate: CommonHelper.emptyDate,
    );
  }
}