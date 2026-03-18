import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_item_view.dart';

class WorkspaceListLoadingView extends StatelessWidget {
  const WorkspaceListLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.router.replaceAll([const DashboardRoute()]);
          },
          child: WorkspaceItemView(workspace: null),
        );
      },
      itemCount: 10, // Adjust the item count as needed
    );
  }
}
