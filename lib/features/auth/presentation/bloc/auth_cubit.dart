import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:kas_rumah/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signIn;
  final SignUpUseCase _signUp;
  final SignOutUseCase _signOut;

  AuthCubit({
    required SignInUseCase signIn,
    required SignUpUseCase signUp,
    required SignOutUseCase signOut,
  }) : _signIn = signIn,
       _signUp = signUp,
       _signOut = signOut,
       super(const AuthInitial());

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
