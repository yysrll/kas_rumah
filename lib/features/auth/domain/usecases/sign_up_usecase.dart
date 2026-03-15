import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignUpUseCase implements UseCase<UserModel, SignUpParams> {
  final AuthRepository repository;
 
  const SignUpUseCase(this.repository);
 
  @override
  Future<Either<Failure, UserModel>> call(SignUpParams params) {
    return repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}
 
class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String? name;
 
  const SignUpParams({
    required this.email,
    required this.password,
    this.name,
  });
 
  @override
  List<Object?> get props => [email, password, name];
}
 