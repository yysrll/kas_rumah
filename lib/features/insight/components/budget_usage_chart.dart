import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetUsageChart extends StatelessWidget {
  const BudgetUsageChart({super.key, required this.data});

  final List<BudgetData> data;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    double totalUsed = data.fold(0, (sum, item) => sum + item.amount);

    return ShadCard(
      child: SizedBox(
        height: 250,
        child: SfCircularChart(
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.strings.insightTotalSpent,
                    style: theme.textTheme.muted.copyWith(fontSize: 12),
                  ),
                  Text(
                    '${(totalUsed / 1000000).toStringAsFixed(1)}jt',
                    style: theme.textTheme.h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
          series: <DoughnutSeries<BudgetData, String>>[
            DoughnutSeries<BudgetData, String>(
              dataSource: data,
              xValueMapper: (BudgetData data, _) => data.category,
              yValueMapper: (BudgetData data, _) => data.amount,
              pointColorMapper: (BudgetData data, _) => data.color,
              // Styling lingkaran
              innerRadius: '75%',
              radius: '100%',
              strokeWidth: 2,
              strokeColor: theme.colorScheme.background,
              enableTooltip: true,
              dataLabelSettings: const DataLabelSettings(isVisible: false),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetData {
  BudgetData(this.category, this.amount, this.color);
  final String category;
  final double amount;
  final Color color;
}
