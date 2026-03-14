import 'package:flutter/material.dart';
import 'package:kas_rumah/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;

  /// similar to [Theme.of(context)]
  ThemeData get theme => Theme.of(this);

  /// similar to [Theme.of(context).colorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  /// Check if dark mode theme is enable
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  /// give access to Theme.of(context).iconTheme.color
  Color? get iconColor => theme.iconTheme.color;

  /// give access to Theme.of(context).textTheme
  TextTheme get textTheme => theme.textTheme;
}