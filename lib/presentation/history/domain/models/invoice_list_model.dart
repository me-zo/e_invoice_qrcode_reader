import '../../../../core/common/models/invoice_model.dart';

class InvoiceListModel {
  List<InvoiceModel> invoices;

  InvoiceListModel({
    required this.invoices,
  });

  factory InvoiceListModel.empty() => InvoiceListModel(invoices: []);
}