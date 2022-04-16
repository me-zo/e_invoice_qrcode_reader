
import 'package:flutter/material.dart';

class TileModel{
  TileModel(
      {required this.name,
        required this.id,
        this.hasTitleText = true,
        this.icon = Icons.list,
      });
  final String name;
  final String id;
  final bool hasTitleText;
  final IconData icon;
}