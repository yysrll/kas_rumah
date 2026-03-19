import 'package:flutter/material.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_item_view.dart';

class WorkspaceListView extends StatelessWidget {
  final List<WorkspaceModel> workspaces;
  final void Function(WorkspaceModel) onTap;
  final Future<void> Function() onRefresh;

  const WorkspaceListView({
    super.key,
    this.workspaces = const [],
    required this.onTap,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (workspaces.isEmpty) {
      return const Center(child: Text('No workspaces available.'));
    }
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final workspace = workspaces[index];
          return GestureDetector(
            onTap: () => onTap(workspace),
            child: WorkspaceItemView(workspace: workspace),
          );
        },
        itemCount: workspaces.length,
      ),
    );
  }
}
