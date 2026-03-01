import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      controller: controller,
      placeholder: Text(context.strings.emailLabel),
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(LucideIcons.mail),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return context.strings.emailMissingError;
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return context.strings.emailInvalidError;
        }
        return null;
        
      },
    );
  }
}
