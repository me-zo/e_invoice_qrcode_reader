
import 'package:e_invoice_qrcode_reader/core/helpers/common_helper.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class InvoiceEntity {
  int id;
  String sellerName;
  String sellerTaxNumber;
  String invoiceDate;
  String invoiceTotal;
  String taxTotal;
  DateTime scannedDate;

  InvoiceEntity({
    this.id = 0,
    required this.sellerName,
    required this.sellerTaxNumber,
    required this.invoiceDate,
    required this.invoiceTotal,
    required this.taxTotal,
    required this.scannedDate,
  });


  InvoiceEntity copyWith({
    int? id,
    String? sellerName,
    String? sellerTaxNumber,
    String? invoiceDate,
    String? invoiceTotal,
    String? taxTotal,
    DateTime? scannedDate,
  }) {
    return InvoiceEntity(
      id: id ?? this.id,
      sellerName: sellerName ?? this.sellerName,
      sellerTaxNumber: sellerTaxNumber ?? this.sellerTaxNumber,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      invoiceTotal: invoiceTotal ?? this.invoiceTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      scannedDate: scannedDate ?? this.scannedDate,
    );
  }
  factory InvoiceEntity.empty() => InvoiceEntity(
      id: 0,
      sellerName: "",
      sellerTaxNumber: "",
      invoiceDate: "",
      invoiceTotal: "",
      taxTotal: "",
      scannedDate: CommonHelper.emptyDate,
    );

}