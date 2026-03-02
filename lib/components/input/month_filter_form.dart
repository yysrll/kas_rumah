import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:year_month_picker/year_month_picker.dart';

class MonthFilterForm extends StatelessWidget {
  const MonthFilterForm({
    super.key,
    required this.selectedMonth,
    required this.onMonthSelected,
  });

  final DateTime? selectedMonth;
  final void Function(DateTime? date) onMonthSelected;

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;
    final displayText = selectedMonth != null
        ? DateFormat("MMMM yyyy").format(selectedMonth!)
        : context.strings.selectMonth;

    return GestureDetector(
      onTap: () async {
        final selected = await showYearMonthPickerDialog(
          context: context,
          firstYear: 2026,
          lastYear: DateTime.now().year,
          initialYearMonth: DateTime.now(),
        );
        onMonthSelected(selected);
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
            Text(displayText),
            const Spacer(),
            Icon(
              LucideIcons.chevronRight,
              color: theme.colorScheme.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }
}
