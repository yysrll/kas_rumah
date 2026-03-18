import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
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
    final theme = context.theme;
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
      child: Card(
        child: Row(
          children: [
            Text(displayText),
            const Spacer(),
            Icon(LucideIcons.chevronRight, color: theme.colorScheme.onSurface),
          ],
        ),
      ),
    );
  }
}
