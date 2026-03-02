import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/overview/components/transaction_overview_item.dart';
import 'package:kas_rumah/features/transaction/components/month_filter_form.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text(context.strings.transactionsTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            SizedBox(height: 12),
            MonthFilterForm(),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return TransactionOverviewItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
