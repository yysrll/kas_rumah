import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:kas_rumah/features/overview/components/transaction_overview_item.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: theme.radius,
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 32,
            children: [
              Expanded(
                child: Text(
                  context.strings.overviewTransactionsCaption,
                  style: theme.textTheme.p.copyWith(
                    color: theme.colorScheme.cardForeground,
                  ),
                ),
              ),
              Text(
                context.strings.seeMore,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            'Maret 2026',
            style: theme.textTheme.p.copyWith(
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
