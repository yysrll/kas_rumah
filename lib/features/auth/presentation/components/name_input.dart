import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return KasTextFormField(
      controller: controller,
      labelText: context.strings.labelName,
      prefixIcon: Icon(Icons.person),
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return context.strings.errorNameRequired;
        }
        return null;
      },
    );
  }
}
