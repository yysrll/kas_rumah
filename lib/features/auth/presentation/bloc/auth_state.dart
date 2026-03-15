part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial / checking session
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Currently loading (sign in / sign up / sign out)
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated with a valid user
class AuthAuthenticated extends AuthState {
  final UserModel user;
  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

/// Not authenticated (logged out or never logged in)
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// Error occurred
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
