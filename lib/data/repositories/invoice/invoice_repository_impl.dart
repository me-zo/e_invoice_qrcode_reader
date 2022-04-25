import 'package:e_invoice_qrcode_reader/data/entities/invoice_entity.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/invoice/invoice_repository.dart';

import '../../../objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class InvoiceRepositoryImpl implements InvoiceRepository {
  /// The Store of this app.
  late final Store store;

  /// A Box of InvoiceEntities.
  late final Box<InvoiceEntity> invoiceEntityBox;

  /// A stream of all InvoiceEntities ordered by date.
  late final Stream<Query<InvoiceEntity>> queryStream;

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<InvoiceRepositoryImpl> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return InvoiceRepositoryImpl._create(store);
  }

  InvoiceRepositoryImpl._create(this.store) {
    invoiceEntityBox = Box<InvoiceEntity>(store);

    final qBuilder = invoiceEntityBox.query()..order(InvoiceEntity_.scannedDate);
    queryStream = qBuilder.watch(triggerImmediately: true);

    // Add some demo data if the box is empty.
    // if (invoiceEntityBox.isEmpty()) {
    //   _insertDemoData();
    // }
  }

  @override
  void delete({required int id}) {
    invoiceEntityBox.remove(id);
  }

  @override
  List<InvoiceEntity> getAll() {
    return invoiceEntityBox.getAll();
  }

  @override
  InvoiceEntity getById({required int id}) {
    return invoiceEntityBox.get(id) ?? InvoiceEntity.empty();
  }

  @override
  void insert({required InvoiceEntity invoiceEntity}) {
    invoiceEntityBox.put(invoiceEntity,mode: PutMode.insert);
  }

  @override
  void update({required InvoiceEntity invoiceEntity}) {
    invoiceEntityBox.put(invoiceEntity,mode: PutMode.update);
  }

  @override
  void deleteAll() {
    invoiceEntityBox.removeAll();
  }
}
