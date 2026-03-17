import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreateWorkspaceView extends StatelessWidget {
  const CreateWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: context.viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Create New Workspace', style: context.textTheme.titleMedium),
          const SizedBox(height: 16),
          KasTextFormField(
            labelText: 'Name',
            prefixIcon: const Icon(LucideIcons.notebookPen),
          ),
          const SizedBox(height: 16),
          KasTextFormField(
            labelText: 'Description',
            prefixIcon: const Icon(LucideIcons.notebookPen),
            minLines: 3,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                // Handle workspace creation logic here
                Navigator.pop(context);
              },
              child: const Text('Create'),
            ),
          ),
        ],
      ),
    );
  }
}
