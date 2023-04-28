import '../../../domain/entities/entities.dart' show FoldersEntity;
import '../../../domain/helpers/helpers.dart' show DomainError, DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show SaveFoldersUseCase;
import '../../cache/cache.dart' show SaveSecureCacheStorage;
import '../../models/models.dart';

class LocalSaveFolders implements SaveFoldersUseCase {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveFolders({
    required this.saveSecureCacheStorage,
  });

  @override
  Future<void> call({required FoldersEntity folders}) async {
    try {
      final String foldersJson = FoldersModel.fromDomain(entity: folders).toJson();
      await saveSecureCacheStorage.save(key: 'folders', value: foldersJson);
    } on DomainError catch (error) {
      throw error.toDomainError();
    }
  }
}
