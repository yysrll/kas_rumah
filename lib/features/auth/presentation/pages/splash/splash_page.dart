import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/di/injector.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/storage/kas_storage.dart';
import 'package:kas_rumah/core/storage/kas_storage_keys.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_selection_cubit.dart';
import 'package:kas_rumah/gen/assets.gen.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    if (mounted) {
      context.read<ProfileCubit>().checkSessionAndProfile();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // if (state is AuthAuthenticated) {
  //           context.router.replaceAll([const WorkspaceRoute()]);
  //         } else if (state is AuthUnauthenticated) {
  //           context.router.replaceAll([const LoginRoute()]);
  //         }
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileCubit, ResourceState<UserModel>>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => {},
            error: (message) {
              context.router.replaceAll([const LoginRoute()]);
              return;
            },
            success: (profile) {
              context.read<WorkspaceSelectionCubit>().loadSelectedWorkspace();
              return;
            },
          ),
        ),
        BlocListener<WorkspaceSelectionCubit, ResourceState<WorkspaceModel>>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => {},
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to fetch workspace: $message')),
              );
              context.router.replaceAll([const LoginRoute()]);
              return;
            },
            success: (workspace) {
              context.router.replaceAll([const WorkspaceRoute()]);
              return;
            },
          ),
        ),
      ],
      child: BlocListener<ProfileCubit, ResourceState<UserModel>>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => {},
          error: (message) {
            context.router.replaceAll([const LoginRoute()]);
            return;
          },
          success: (profile) {
            final kasStorage = getIt<KasStorage>();
            final workspaceId = kasStorage.getString(
              KasStorageKeys.workspaceUidKey,
            );

            if (workspaceId == null || workspaceId.isEmpty) {
              context.router.replaceAll([const LoginRoute()]);
            } else {
              context.router.replaceAll([const WorkspaceRoute()]);
            }
            return;
          },
        ),
        child: AppScaffold(
          body: FadeTransition(
            opacity: _opacity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppAsset.logo.svg(width: 120, height: 120),
                  const SizedBox(height: 24),
                  Text(
                    context.strings.appTitle,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.strings.taglineAlternative,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
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
