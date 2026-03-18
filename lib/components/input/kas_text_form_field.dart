import 'package:flutter/material.dart';

class KasTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const KasTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.validator,
    this.minLines,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1.0,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
