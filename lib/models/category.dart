import 'package:flutter/material.dart';

class category {
  final String Id;
  final String title;
  final Color colors;

  const category({
    required this.Id,
    required this.title,
    this.colors = Colors.orange,
  });
}
