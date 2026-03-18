import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignInUseCase implements UseCase<UserModel, SignInParams> {
  final AuthRepository repository;

  const SignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(SignInParams params) {
    return repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
