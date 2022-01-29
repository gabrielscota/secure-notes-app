import 'dart:convert';

import '../../../domain/entities/entities.dart' show FolderEntity;
import '../../../domain/helpers/helpers.dart' show DomainError, DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show FetchFoldersUseCase;
import '../../cache/cache.dart' show FetchSecureCacheStorage;
import '../../models/models.dart' show LocalFolderModel, LocalFoldersModel, LocalNoteModel;

class LocalFetchFolders implements FetchFoldersUseCase {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalFetchFolders({
    required this.fetchSecureCacheStorage,
  });

  @override
  Future<List<FolderEntity>> call() async {
    try {
      // final String jsonStringfied = await fetchSecureCacheStorage.fetch(key: 'folders');
      final jsonStringfied = mockedLocalFoldersData();
      // throw ModelError.localParseData();
      return LocalFoldersModel.fromJson(jsonStringfied: jsonStringfied).toEntity();
    } on DomainError catch (error) {
      throw error.toDomainError();
    }
  }
}

String mockedLocalFoldersData() {
  final LocalFoldersModel folders = LocalFoldersModel(
    folders: [
      LocalFolderModel(
        id: '0',
        title: 'Default',
        description: 'Teste',
        notes: [
          LocalNoteModel(
            id: '0',
            title: 'Teste note 1',
            text: 'Text',
            isFavorite: false,
            tags: [],
            createdAt: '',
            updatedAt: '',
          ),
        ],
        createdAt: '',
        updatedAt: '',
      ),
    ],
  );
  return jsonEncode(folders.toJson());
}
