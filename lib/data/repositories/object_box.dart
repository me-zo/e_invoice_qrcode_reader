
import 'package:e_invoice_qrcode_reader/data/entities/tlv_entity.dart';

import '../../objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store store;

  /// A Box of TlvEntities.
  late final Box<TlvEntity> tlvEntityBox;

  /// A stream of all TlvEntities ordered by date.
  late final Stream<Query<TlvEntity>> queryStream;

  ObjectBox._create(this.store) {
    tlvEntityBox = Box<TlvEntity>(store);

    final qBuilder = tlvEntityBox.query()
      ..order(TlvEntity_.dateScanned);
    queryStream = qBuilder.watch(triggerImmediately: true);

    // Add some demo data if the box is empty.
    if (tlvEntityBox.isEmpty()) {
      _insertDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void _insertDemoData() {
    final demoTlvEntities = [
      TlvEntity(value: "saudi arabia",dateScanned: DateTime.now().toUtc(), groupId: 1 ),
      TlvEntity(value: "1225.00 SAR",dateScanned: DateTime.now().toUtc(), groupId: 1 ),
      TlvEntity(value: "25.00 SAR",dateScanned: DateTime.now().toUtc(), groupId: 1 ),
      TlvEntity(value: "25.00 SAR",dateScanned: DateTime.now().toUtc(), groupId: 1 ),
      TlvEntity(value: "25.00 SAR",dateScanned: DateTime.now().toUtc(), groupId: 1 ),
    ];
    tlvEntityBox.putMany(demoTlvEntities);
  }
}