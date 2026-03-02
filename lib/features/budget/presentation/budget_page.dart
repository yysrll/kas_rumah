import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;
    // Data dummy: Pengeluaran yang sudah terpakai
    final List<Map<String, dynamic>> budgetList = [
      {'name': 'Kebutuhan Dapur', 'amount': 2500000},
      {'name': 'Listrik & WiFi', 'amount': 850000},
      {'name': 'Pendidikan Anak', 'amount': 1200000},
      {'name': 'Tabungan Darurat', 'amount': 1000000},
      {'name': 'Hiburan Akhir Pekan', 'amount': 500000},
    ];
    return AppScaffold(
      appBar: AppBar(title: Text(context.strings.insightsTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultScreenPadding),
        child: budgetList.isEmpty
            ? _buildEmptyState(context)
            : ListView.separated(
                itemCount: budgetList.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = budgetList[index];
                  return ShadCard(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nama Budget
                        Expanded(
                          child: Text(
                            item['name'],
                            style: theme.textTheme.p.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Nominal per Bulan
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Per Bulan",
                              style: theme.textTheme.muted.copyWith(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "IDR ${(item['amount'] / 1000).toStringAsFixed(0)}K",
                              style: theme.textTheme.small.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LucideIcons.wallet,
            size: 48,
            color: context.shadTheme.colorScheme.muted,
          ),
          const SizedBox(height: 16),
          Text("Belum ada anggaran", style: context.shadTheme.textTheme.muted),
        ],
      ),
    );
  }
}
