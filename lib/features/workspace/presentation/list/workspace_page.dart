import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/components/surface/kas_card.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/dashboard/presentation/dashboard_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(context.strings.workspaceTitle),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultScreenPadding),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                  (route) => false,
                );
              },
              child: KasCard(
                child: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      LucideIcons.notebookPen,
                      size: 24,
                      color: context.theme.colorScheme.onSurface,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Tangga ${index + 1}',
                          style: context.textTheme.bodySmall,
                        ),
                        Text(
                          'Rumah Tangga deskription ${index + 1}',
                          style: context.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
