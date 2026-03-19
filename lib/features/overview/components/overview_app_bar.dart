import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:kas_rumah/features/setting/presentation/setting_page.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_selection_cubit.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppBar(
      title: Row(
        spacing: 16,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
            child: Icon(
              Icons.account_circle,
              size: 24,
              color: theme.colorScheme.primary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ResourceState<UserModel>>(
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    success: (user) => Text(
                      'Hi, ${user.name}',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await context
                        .read<WorkspaceSelectionCubit>()
                        .clearSelectedWorkspace();
                    if (context.mounted) {
                      context.router.replaceAll([const WorkspaceRoute()]);
                    }
                  },
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.dataset_rounded,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      Flexible(
                        child:
                            BlocBuilder<
                              WorkspaceSelectionCubit,
                              ResourceState<WorkspaceModel>
                            >(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const SizedBox.shrink(),
                                success: (workspace) => Text(
                                  workspace.name,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.colorScheme.primary,
              ),
              child: Icon(
                LucideIcons.bolt,
                size: 24,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
