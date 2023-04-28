import '../../entities/entities.dart';

abstract class SaveCurrentUserUseCase {
  Future<void> call({required UserEntity user});
}
