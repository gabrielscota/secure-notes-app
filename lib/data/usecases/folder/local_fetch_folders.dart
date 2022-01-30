import 'dart:convert';

import '../../../domain/entities/entities.dart' show FoldersEntity;
import '../../../domain/helpers/helpers.dart' show DomainError, DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show FetchFoldersUseCase;
import '../../cache/cache.dart' show FetchSecureCacheStorage;
import '../../models/models.dart' show FolderModel, FoldersModel, NoteModel;

class LocalFetchFolders implements FetchFoldersUseCase {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalFetchFolders({
    required this.fetchSecureCacheStorage,
  });

  @override
  Future<FoldersEntity> call() async {
    try {
      // final String jsonStringfied = await fetchSecureCacheStorage.fetch(key: 'folders');
      final jsonStringfied = mockedLocalFoldersData();
      // throw ModelError.localParseData();
      return FoldersModel.fromJson(json: jsonStringfied);
    } on DomainError catch (error) {
      throw error.toDomainError();
    }
  }
}

String mockedLocalFoldersData() {
  const FoldersModel folders = FoldersModel(
    dtoFolders: [
      FolderModel(
        dtoId: '0',
        dtoTitle: 'Default',
        dtoDescription: 'Teste',
        dtoNotes: [
          NoteModel(
            dtoId: '0',
            dtoTitle: 'Teste note 1',
            dtoText: 'Text',
            dtoIsFavorite: false,
            dtoTags: [],
            dtoCreatedAt: '',
            dtoUpdatedAt: '',
          ),
        ],
        dtoCreatedAt: '',
        dtoUpdatedAt: '',
      ),
    ],
  );
  return jsonEncode(folders.toJson());
}
