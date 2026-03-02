import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:kas_rumah/features/overview/presentation/overview_page.dart';
import 'package:kas_rumah/features/transaction/presentation/transaction_page.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Daftar halaman untuk setiap tab
  final List<Widget> _pages = [
    const OverviewPage(),
    const TransactionPage(),
    const Center(child: Text("Insight - Analisis Pengeluaran")),
    const Center(child: Text("Budget - Atur Anggaran")),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;

    return AppScaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.mutedForeground,
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
