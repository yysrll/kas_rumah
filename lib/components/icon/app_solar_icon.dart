import 'package:flutter/material.dart';
import 'package:flutty_solar_icons/solar_icons_flutter.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class AppSolarIcon extends StatelessWidget {
  const AppSolarIcon(
    this.icon, {
    super.key,
    this.weight = SolarIconWeight.boldDuotone,
    this.color,
    this.secondaryColor,
    this.size,
  });

  final SolarIconData icon;
  final SolarIconWeight weight;
  final Color? color;
  final Color? secondaryColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final iconColor = color ?? theme.colorScheme.primary;
    final iconSecondaryColor =
        secondaryColor ?? iconColor.withValues(alpha: 0.2);
    final iconSize = size ?? 28.0;

    return SolarIcon(
      icon,
      weight: weight,
      color: iconColor,
      secondaryColor: iconSecondaryColor,
      size: iconSize,
    );
  }
}
