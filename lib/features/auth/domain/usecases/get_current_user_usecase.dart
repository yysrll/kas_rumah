import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/errors/failure.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GetCurrentUserUseCase implements UseCase<UserModel?, NoParams> {
  final AuthRepository repository;

  const GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel?>> call(NoParams params) {
    return repository.getCurrentUser();
  }
}
