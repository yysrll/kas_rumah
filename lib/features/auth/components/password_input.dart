import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    return ShadInput(
      controller: widget.controller,
      placeholder: Text(context.strings.passwordLabel),
      obscureText: obscure,
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(LucideIcons.lock),
      ),
      trailing: ShadIconButton(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye, size: 16),
        onPressed: () {
          setState(() => obscure = !obscure);
        },
      ),
    );
  }
}
