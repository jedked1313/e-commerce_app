import 'package:flutter/material.dart';

class SettingsModel {
  final String title;
  final Icon leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  SettingsModel({
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
  });
}
