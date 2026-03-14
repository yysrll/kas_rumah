import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/insight/components/budget_usage_chart.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetDetailList extends StatelessWidget {
  const BudgetDetailList({super.key, required this.data});

  final List<BudgetData> data;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final double totalUsed = data.fold(0, (sum, item) => sum + item.amount);

    return ShadCard(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = data[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(item.category, style: theme.textTheme.bodySmall),
                  ),
                  Text(
                    context.strings.budgetRemaining(item.amount),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              ShadProgress(
                value: item.amount / totalUsed,
                borderRadius: BorderRadius.circular(4),
                color: item.color,
              ),
            ],
          );
        },
      ),
    );
  }
}
