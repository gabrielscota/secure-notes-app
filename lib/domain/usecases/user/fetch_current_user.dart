import '../../entities/entities.dart';

abstract class FetchCurrentUserUseCase {
  Future<UserEntity> call();
}
