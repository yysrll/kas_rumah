import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kas_rumah/core/state/resource_state.dart';
import 'package:kas_rumah/core/usecase/usecase.dart';
import 'package:kas_rumah/features/auth/domain/models/user_model.dart';
import 'package:kas_rumah/features/auth/domain/usecases/get_current_user_usecase.dart';

@injectable
class ProfileCubit extends Cubit<ResourceState<UserModel>> {
  final GetCurrentUserUseCase _getCurrentUser;

  ProfileCubit(this._getCurrentUser)
    : super(const ResourceState.initial());

  Future<void> checkSessionAndProfile() async {
    emit(const ResourceState.loading());
    final user = await _getCurrentUser(const NoParams());
    user.fold(
      (failure) => emit(const ResourceState.error("Failed to get profile")),
      (user) {
        if (user == null) {
          emit(const ResourceState.error("No user session found"));
          return;
        }
        emit(ResourceState.success(user));
      },
    );
    // if (user.isLeft()) {
    //   emit(const ResourceState.error("Failed to get current user"));
    //   return;
    // }

    // final profile = await _repository.getProfile();
    // profile.fold(
    //   (failure) => emit(const ResourceState.error("Failed to get profile")),
    //   (user) {
    //     emit(ResourceState.success(user));
    //   },
    // );
  }
}
