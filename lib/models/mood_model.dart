import 'package:flutter/material.dart';

class Mood {
  final String label;
  final String icon;
  final Color color;
  final String description;

  const Mood({
    required this.label,
    required this.icon,
    required this.color,
    required this.description,
  });
}
