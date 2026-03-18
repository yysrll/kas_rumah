import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return KasTextFormField(
      controller: widget.controller,
      labelText: context.strings.labelPassword,
      obscureText: obscure,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => obscure = !obscure),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.strings.errorPasswordRequired;
        }
        if (value.length < 6) {
          return context.strings.errorPasswordTooShort;
        }
        return null;
      },
    );
  }
}
