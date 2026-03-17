import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_item_view.dart';

class WorkspaceListView extends StatelessWidget {
  final List<WorkspaceModel> workspaces;

  const WorkspaceListView({super.key, this.workspaces = const []});

  @override
  Widget build(BuildContext context) {
    if (workspaces.isEmpty) {
      return const Center(
        child: Text('No workspaces available.'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final workspace = workspaces[index];
        return GestureDetector(
          onTap: () {
            context.router.replaceAll([const DashboardRoute()]);
          },
          child: WorkspaceItemView(workspace: workspace),
        );
      },
      itemCount: workspaces.length,
    );
  }
}
