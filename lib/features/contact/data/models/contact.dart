import 'package:flutter/material.dart';

class Contact {
  final String label;
  final String content;
  final IconData icon;
  final Color iconBgColor;
  final Color bgColor;

  Contact({
    required this.label,
    required this.content,
    required this.icon,
    required this.iconBgColor,
    required this.bgColor
  });
}