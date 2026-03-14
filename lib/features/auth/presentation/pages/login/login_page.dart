import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/components/surface/kas_card.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/presentation/components/email_input.dart';
import 'package:kas_rumah/features/auth/presentation/components/password_input.dart';
import 'package:kas_rumah/features/workspace/presentation/list/workspace_page.dart';
import 'package:kas_rumah/gen/assets.gen.dart';

@RoutePage()
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
    final theme = context.theme;
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
                KasCard(
                  child: Column(
                    children: [
                      Text(
                        context.strings.titleLogin,
                        style: context.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 24),
                      EmailInput(controller: _emailController),
                      const SizedBox(height: 16),
                      PasswordInput(controller: _passwordController),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {}
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => WorkspacePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text("Masuk"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    context.pushRoute(RegisterRoute());
                  },
                  child: Text(context.strings.actionDontHaveAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
