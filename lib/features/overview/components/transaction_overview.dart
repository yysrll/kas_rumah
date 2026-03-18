import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/overview/components/transaction_overview_item.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 32,
            children: [
              Expanded(
                child: Text(
                  context.strings.overviewTransactionsCaption,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.surfaceContainerLow,
                  ),
                ),
              ),
              Text(
                context.strings.seeMore,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            'Maret 2026',
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return TransactionOverviewItem();
            },
          ),
        ],
      ),
    );
  }
}
