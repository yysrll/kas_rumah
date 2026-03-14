import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class MonthlySnapshot extends StatelessWidget {
  const MonthlySnapshot({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.strings.overviewMonthlySnapshotTitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'IDR 970K',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: ' /IDR 1.100K',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              value: 0.88,
                              strokeWidth: 2,
                              color: Colors.green.shade500,
                              backgroundColor: Colors.grey.shade400,
                            ),
                          ),
                          Text(
                            '87%',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.green.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '${context.strings.overviewAvgDailySpend}: IDR 32K',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.green.shade700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              context.strings.overviewWithinBudgetCaption,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                fontSize: 12,
                color: Colors.green.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
