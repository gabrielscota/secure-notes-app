import '../../entities/entities.dart';

abstract class SaveFoldersUseCase {
  Future<void> call({required FoldersEntity folders});
}
