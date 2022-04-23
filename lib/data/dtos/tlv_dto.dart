import 'dart:convert';

class TlvDto {
  int tag;
  String key;
  String value;

  TlvDto({
    required this.tag,
    required this.key,
    required this.value,
  });

  factory TlvDto.fromRawJson(String str) => TlvDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TlvDto.fromJson(Map<String, dynamic> json) => TlvDto(
    tag: json["tag"] ?? 0,
    key: json["key"] ?? "",
    value: json["value"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "tag": tag,
    "key": key,
    "value": value,
  };

}