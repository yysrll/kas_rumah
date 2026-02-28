import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ContextExtension on BuildContext {
  ShadThemeData get shadTheme => ShadTheme.of(this);

  ShadTextTheme get textTheme => shadTheme.textTheme;

  ShadColorScheme get colorScheme => shadTheme.colorScheme;
}
