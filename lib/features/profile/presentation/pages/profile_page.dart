import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is AuthUnauthenticated) {
          context.router.replace(const LoginRoute());
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: AppScaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: ListView(
          children: [
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith((state) {
                  return context.colorScheme.error;
                }),
                foregroundColor: WidgetStateColor.resolveWith((state) {
                  return context.colorScheme.onError;
                }),
              ),
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              child: Text('Logout'),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Delete Account',
                style: TextStyle(color: context.colorScheme.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
