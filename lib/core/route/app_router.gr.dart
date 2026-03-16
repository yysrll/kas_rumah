// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:kas_rumah/features/auth/presentation/pages/login/login_page.dart'
    as _i1;
import 'package:kas_rumah/features/auth/presentation/pages/register/register_page.dart'
    as _i3;
import 'package:kas_rumah/features/auth/presentation/pages/splash/splash_page.dart'
    as _i4;
import 'package:kas_rumah/features/profile/presentation/pages/profile_page.dart'
    as _i2;
import 'package:kas_rumah/features/workspace/presentation/list/workspace_page.dart'
    as _i5;

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginPage();
    },
  );
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProfilePage();
    },
  );
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute({List<_i6.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}

/// generated route for
/// [_i5.WorkspacePage]
class WorkspaceRoute extends _i6.PageRouteInfo<void> {
  const WorkspaceRoute({List<_i6.PageRouteInfo>? children})
    : super(WorkspaceRoute.name, initialChildren: children);

  static const String name = 'WorkspaceRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.WorkspacePage();
    },
  );
}
