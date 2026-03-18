import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/di/injector.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/workspace/domain/models/workspace_model.dart';
import 'package:kas_rumah/features/workspace/presentation/bloc/workspace_cubit.dart';
import 'package:kas_rumah/features/workspace/presentation/components/create_workspace_view.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_list_loading_view.dart';
import 'package:kas_rumah/features/workspace/presentation/components/workspace_list_view.dart';

@RoutePage()
class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkspaceCubit>()..getWorkspaces(),
      child: _WorkspacePageView(),
    );
  }
}

class _WorkspacePageView extends StatelessWidget {
  const _WorkspacePageView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
            builder: (context) {
              return CreateWorkspaceView();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<WorkspaceCubit, ResourceState<List<WorkspaceModel>>>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const WorkspaceListLoadingView(),
            success: (workspaces) => WorkspaceListView(workspaces: workspaces),
            error: (error) => Center(child: Text(error)),
          ),
        ),
      ),
    );
  }
}
