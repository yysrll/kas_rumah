import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/components/surface/kas_card.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:kas_rumah/features/auth/presentation/components/confirm_password_input.dart';
import 'package:kas_rumah/features/auth/presentation/components/email_input.dart';
import 'package:kas_rumah/features/auth/presentation/components/name_input.dart';
import 'package:kas_rumah/features/auth/presentation/components/password_input.dart';
import 'package:kas_rumah/gen/assets.gen.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      name: _nameController.text.trim().isEmpty
          ? null
          : _nameController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is AuthAuthenticated) {
          context.router.replace(const WorkspaceRoute());
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: theme.colorScheme.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
        }
      },
      child: AppScaffold(
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
                          context.strings.titleRegister,
                          style: context.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 24),
                        NameInput(controller: _nameController),
                        const SizedBox(height: 16),
                        EmailInput(controller: _emailController),
                        const SizedBox(height: 16),
                        PasswordInput(controller: _passwordController),
                        const SizedBox(height: 16),
                        ConfirmPasswordInput(
                          controller: _confirmPasswordController,
                          passwordController: _passwordController,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: _submit,
                            child: Text(context.strings.buttonRegister),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(context.strings.actionAlreadyHaveAccount),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
