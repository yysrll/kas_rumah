import 'package:auto_route/auto_route.dart';
import 'package:kas_rumah/core/route/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    // AUTH
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    // PROFILE
    AutoRoute(page: ProfileRoute.page),
    // WORKSPACE
    AutoRoute(page: WorkspaceRoute.page),
    // DASHBOARD
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: OverviewRoute.page, initial: true),
        AutoRoute(page: TransactionRoute.page),
        AutoRoute(page: InsightRoute.page),
        AutoRoute(page: BudgetRoute.page),
      ],
    ),
  ];
}
