
import 'dart:convert';

class NavigatorTileModel {
  NavigatorTileModel({
    required this.tileId,
    required this.title,
    required this.description,
  });

  final int tileId;
  final String title;
  final String description;

  factory NavigatorTileModel.fromRawJson(String str) => NavigatorTileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NavigatorTileModel.fromJson(Map<String, dynamic> json) => NavigatorTileModel(
    tileId: json["tileId"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "tileId": tileId,
    "title": title,
    "description": description,
  };
}
