import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/features/overview/components/monthly_snapshot.dart';
import 'package:kas_rumah/features/overview/components/overview_app_bar.dart';
import 'package:kas_rumah/features/overview/components/transaction_overview.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: OverviewAppBar(),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
