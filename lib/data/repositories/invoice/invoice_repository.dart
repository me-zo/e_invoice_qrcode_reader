import 'package:e_invoice_qrcode_reader/data/entities/invoice_entity.dart';

abstract class InvoiceRepository {
  List<InvoiceEntity> getAll();

  InvoiceEntity getById({required int id});

  void insert({required InvoiceEntity invoiceEntity});

  void update({required InvoiceEntity invoiceEntity});

  void delete({required int id});

  void deleteAll();
}
