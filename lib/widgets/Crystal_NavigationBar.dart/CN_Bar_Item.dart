import 'package:flutter/material.dart';

/// A tab to display in a [CrystalNavigationBar]
class CrystalNavigationBarItem {
  
  /// An icon to display.
  final IconData icon;

  /// An icon to display when the tab is not selected.
  final IconData? unselectedIcon;

  /// A color to use for this tab when selected.
  final Color? selectedColor;

  /// The color to use for this tab when not selected.
  final Color? unselectedColor;

  /// The title to display for the tab.
  final String? title;

  CrystalNavigationBarItem({
    required this.icon,
    this.unselectedIcon,
    this.selectedColor,
    this.unselectedColor,
    this.title,
  });
}
