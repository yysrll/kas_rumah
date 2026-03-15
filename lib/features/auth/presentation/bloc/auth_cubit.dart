import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUserUseCase _getCurrentUser;
  final SignInUseCase _signIn;
  final SignUpUseCase _signUp;
  final SignOutUseCase _signOut;

  AuthCubit({
    required GetCurrentUserUseCase getCurrentUser,
    required SignInUseCase signIn,
    required SignUpUseCase signUp,
    required SignOutUseCase signOut,
  }) : _getCurrentUser = getCurrentUser,
       _signIn = signIn,
       _signUp = signUp,
       _signOut = signOut,
       super(const AuthInitial());

  /// Called on app start / splash screen
  Future<void> checkAuthStatus() async {
    emit(const AuthLoading());
    final result = await _getCurrentUser(const NoParams());
    result.fold((failure) => emit(const AuthUnauthenticated()), (user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    });
  }

  /// Sign in with email + password
  Future<void> signIn({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _signIn(
      SignInParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Register with email + password
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    emit(const AuthLoading());
    final result = await _signUp(
      SignUpParams(email: email, password: password, name: name),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  /// Sign out
  Future<void> signOut() async {
    emit(const AuthLoading());
    final result = await _signOut(const NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthUnauthenticated()),
    );
  }
}
