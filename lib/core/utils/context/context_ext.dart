import 'package:flutter/material.dart';
import 'package:kas_rumah/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}