

import 'package:flutter/material.dart';
import 'package:kas_rumah/components/surface/kas_card.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class WorkspaceItemView extends StatelessWidget {
  final WorkspaceModel? workspace;
  
  const WorkspaceItemView({
    super.key,
    required this.workspace,
  });

  @override
  Widget build(BuildContext context) {
    return KasCard(
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
                workspace?.name ?? '-',
                style: context.textTheme.bodySmall,
              ),
              Text(
                workspace?.description ?? '-',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
