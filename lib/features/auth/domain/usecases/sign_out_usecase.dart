import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignOutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository repository;
 
  const SignOutUseCase(this.repository);
 
  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return repository.signOut();
  }
}
 