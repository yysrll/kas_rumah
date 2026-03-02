import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:year_month_picker/year_month_picker.dart';

class MonthFilterForm extends StatelessWidget {
  const MonthFilterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(context.strings.transactionsFilterByMonth),
        GestureDetector(
          onTap: () async {
            final selected = await showYearMonthPickerDialog(
              context: context,
              firstYear: 2026,
              lastYear: DateTime.now().year,
              initialYearMonth: DateTime.now(),
            );
            log("Selected month: $selected");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: theme.colorScheme.card,
              borderRadius: theme.radius,
              border: Border.all(color: theme.colorScheme.border),
            ),
            child: Row(
              children: [
                Text('Maret 2026'),
                const Spacer(),
                Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.mutedForeground,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
