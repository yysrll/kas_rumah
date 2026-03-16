import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/overview/components/overview_app_bar.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PreferredSizeWidget _buildAppBar(int index) {
    switch (index) {
      case 0:
        return const OverviewAppBar();
      case 1:
        return AppBar(title: Text(context.strings.transactionsTitle));
      case 2:
        return AppBar(title: Text(context.strings.insightsTitle));
      case 3:
        return AppBar(title: Text(context.strings.budgetsTitle));
      default:
        return AppBar(title: Text(context.strings.appTitle));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AutoTabsRouter.pageView(
      routes: [
        const OverviewRoute(),
        const TransactionRoute(),
        const InsightRoute(),
        const BudgetRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return AppScaffold(
          appBar: _buildAppBar(tabsRouter.activeIndex),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 4,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: theme.colorScheme.primary,
            unselectedItemColor: theme.colorScheme.onSurfaceVariant,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(LucideIcons.house),
                label: context.strings.overviewTitle,
              ),

              BottomNavigationBarItem(
                icon: const Icon(LucideIcons.handCoins),
                label: context.strings.transactionsTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(LucideIcons.chartBar),
                label: context.strings.insightsTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(LucideIcons.wallet),
                label: context.strings.budgetsTitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
