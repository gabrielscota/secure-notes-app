import '../../entities/entities.dart';

abstract class FetchFoldersUseCase {
  Future<List<FolderEntity>> call();
}
