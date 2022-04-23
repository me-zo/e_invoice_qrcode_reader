
import 'package:objectbox/objectbox.dart';

@Entity()
class TlvEntity{
  int id;
  int groupId;
  String value;
  DateTime dateScanned;

  TlvEntity({
    this.id = 0,
    required this.groupId,
    required this.value,
    required this.dateScanned,
  });
}