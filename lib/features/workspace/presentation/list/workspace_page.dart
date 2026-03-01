import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:kas_rumah/features/dashboard/presentation/dashboard_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text(context.strings.workspaceTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(LucideIcons.plus),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultScreenPadding),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                  (route) => false,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: context.shadTheme.radius,
                  border: Border.all(
                    color: context.shadTheme.colorScheme.border,
                  ),
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      LucideIcons.notebookPen,
                      size: 24,
                      color: context.shadTheme.colorScheme.foreground,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Tangga ${index + 1}',
                          style: context.textTheme.small,
                        ),
                        Text(
                          'Rumah Tangga deskription ${index + 1}',
                          style: context.textTheme.muted,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemCount: 10,
        ),
      ),
    );
  }
}
