import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return KasTextFormField(
      controller: controller,
      labelText: context.strings.labelEmail,
      prefixIcon: Icon(Icons.mail),
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return context.strings.errorEmailRequired;
        }
        if (!RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        ).hasMatch(value ?? '')) {
          return context.strings.errorEmailInvalid;
        }
        return null;
      },
    );
  }
}
