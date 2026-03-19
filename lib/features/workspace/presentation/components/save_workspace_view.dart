import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SaveWorkspaceView extends StatefulWidget {
  final String? workspaceId;
  final String? name;
  final String? description;
  final void Function({String? id, required String name, String? description})?
  onSave;

  const SaveWorkspaceView({
    super.key,
    this.workspaceId,
    this.name,
    this.description,
    this.onSave,
  });

  @override
  State<SaveWorkspaceView> createState() => _SaveWorkspaceViewState();
}

class _SaveWorkspaceViewState extends State<SaveWorkspaceView> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _descriptionController = TextEditingController(text: widget.description);
  }

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
            controller: _nameController,
            labelText: 'Name',
            prefixIcon: const Icon(LucideIcons.notebookPen),
          ),
          const SizedBox(height: 16),
          KasTextFormField(
            controller: _descriptionController,
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
                widget.onSave?.call(
                  id: widget.workspaceId,
                  name: _nameController.text,
                  description: _descriptionController.text,
                );

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
