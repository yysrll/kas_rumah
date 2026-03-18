import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({
    super.key,
    this.controller,
    this.passwordController,
  });

  final TextEditingController? controller;
  final TextEditingController? passwordController;

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return KasTextFormField(
      controller: widget.controller,
      labelText: context.strings.labelConfirmPassword,
      obscureText: obscure,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => obscure = !obscure),
      ),
      validator: (value) {
        if (value != widget.passwordController?.text) {
          return context.strings.errorPasswordMismatch;
        }
        return null;
      },
    );
  }
}
