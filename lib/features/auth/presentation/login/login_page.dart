import 'package:flutter/material.dart';
import 'package:kas_rumah/components/input/kas_text_form_field.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/workspace/presentation/list/workspace_page.dart';
import 'package:kas_rumah/gen/assets.gen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultScreenPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppAsset.logo.svg(width: 120, height: 120),
                const SizedBox(height: 24),
                Text(
                  context.strings.loginTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                KasTextFormField(
                  controller: _emailController,
                  labelText: "Email",
                ),
                const SizedBox(height: 16),
                KasTextFormField(
                  controller: _passwordController,
                  labelText: "Password",
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {}
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => WorkspacePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text("Masuk dengan Google"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
