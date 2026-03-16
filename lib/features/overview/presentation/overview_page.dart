import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/features/overview/components/monthly_snapshot.dart';
import 'package:kas_rumah/features/overview/components/transaction_overview.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultScreenPadding),
        child: Column(
          children: [
            const MonthlySnapshot(),
            const SizedBox(height: 16),
            const TransactionOverview(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
