import '../../entities/entities.dart';

abstract class FetchFoldersUseCase {
  Future<FoldersEntity> call();
}
