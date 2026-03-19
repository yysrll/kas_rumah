import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/di/injector.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_save_cubit.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_cubit.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_selection_cubit.dart';
import 'package:kas_rumah/features/workspace/presentation/components/save_workspace_view.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_list_loading_view.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_list_view.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WorkspaceCubit>()..getWorkspaces(),
        ),
        BlocProvider(create: (context) => getIt<WorkspaceSaveCubit>()),
        BlocProvider(create: (context) => getIt<WorkspaceSelectionCubit>()),
      ],
      child: _WorkspacePageView(),
    );
  }
}

class _WorkspacePageView extends StatelessWidget {
  const _WorkspacePageView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WorkspaceSelectionCubit, ResourceState<WorkspaceModel>>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => context.loaderOverlay.hide(),
            loading: () => context.loaderOverlay.show(),
            success: (workspace) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Workspace ${workspace.name} selected!'),
                ),
              );
              context.router.replaceAll([const DashboardRoute()]);
              return;
            },
            error: (error) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to select workspace: $error')),
              );
              return;
            },
          ),
        ),
        BlocListener<WorkspaceSaveCubit, ResourceState<WorkspaceModel>>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => context.loaderOverlay.hide(),
            loading: () => context.loaderOverlay.show(),
            success: (workspace) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Workspace ${workspace.name} saved successfully!',
                  ),
                ),
              );
              context.read<WorkspaceCubit>().getWorkspaces();
              return;
            },
            error: (error) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to save workspace: $error')),
              );
              return;
            },
          ),
        ),
      ],
      child: AppScaffold(
        appBar: AppBar(
          title: Text(context.strings.workspaceTitle),
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(const ProfileRoute());
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              builder: (modalContext) {
                return SaveWorkspaceView(
                  onSave: ({description, id, required name}) {
                    context.read<WorkspaceSaveCubit>().saveWorkspace(
                      id: id,
                      name: name,
                      description: description,
                    );
                  },
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child:
              BlocBuilder<WorkspaceCubit, ResourceState<List<WorkspaceModel>>>(
                builder: (context, state) => state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () => const WorkspaceListLoadingView(),
                  success: (workspaces) => WorkspaceListView(
                    workspaces: workspaces,
                    onTap: (workspace) {
                      context.read<WorkspaceSelectionCubit>().selectWorkspace(
                        workspace,
                      );
                    },
                    onRefresh: () async {
                      await context.read<WorkspaceCubit>().getWorkspaces();
                    },
                  ),
                  error: (error) => Center(child: Text(error)),
                ),
              ),
        ),
      ),
    );
  }
}
