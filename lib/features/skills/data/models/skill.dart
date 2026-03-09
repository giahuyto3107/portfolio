import 'package:flutter/cupertino.dart';

class Skill {
  final double percentage;
  final IconData icon;
  final String label;
  final Color color;

  Skill({
    required this.percentage,
    required this.icon,
    required this.label,
    required this.color
  });
}