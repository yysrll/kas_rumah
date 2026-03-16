import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/insight/components/budget_detail_list.dart';
import 'package:kas_rumah/features/insight/components/budget_usage_chart.dart';
import 'package:kas_rumah/components/input/month_filter_form.dart';

@RoutePage()
class InsightPage extends StatelessWidget {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    // Data dummy: Pengeluaran yang sudah terpakai
    final List<BudgetData> chartData = [
      BudgetData('Housing', 4500000, theme.colorScheme.primary),
      BudgetData('Food', 2000000, const Color(0xFFfbbf24)), // Amber
      BudgetData('Transport', 800000, const Color(0xFF38bdf8)), // Sky
      BudgetData('Others', 500000, theme.colorScheme.secondary),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SizedBox(height: 12),
          MonthFilterForm(
            selectedMonth: DateTime.now(),
            onMonthSelected: (_) {},
          ),
          Expanded(
            child: ListView(
              children: [
                BudgetUsageChart(data: chartData),
                SizedBox(height: 12),
                BudgetDetailList(data: chartData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
