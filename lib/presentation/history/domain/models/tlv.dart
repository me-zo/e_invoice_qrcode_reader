class TlvModel {
  int tag;
  String key;
  String value;

  TlvModel({
    required this.tag,
    required this.key,
    required this.value,
  });

  @override
  String toString() {
    return "tag: $tag value: $value ";
  }
}