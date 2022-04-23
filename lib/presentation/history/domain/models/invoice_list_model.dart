import 'package:e_invoice_qrcode_reader/core/common/models/invoice_model.dart';

class InvoiceListModel {
  List<InvoiceModel> invoices;

  InvoiceListModel({
    required this.invoices,
  });

  factory InvoiceListModel.empty() => InvoiceListModel(invoices: []);
}