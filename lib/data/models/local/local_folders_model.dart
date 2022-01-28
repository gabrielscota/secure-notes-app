import 'dart:convert';

import '../../../domain/entities/entities.dart' show FolderEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;
import 'local.dart' show LocalFolderModel;

class LocalFoldersModel {
  final List<LocalFolderModel> folders;

  LocalFoldersModel({
    required this.folders,
  });

  factory LocalFoldersModel.fromJson({required final String jsonStringfied}) {
    try {
      final Json json = jsonDecode(jsonStringfied.isEmpty ? '{}' : jsonStringfied);
      if (!json.keys.toSet().containsAll([
        'folders',
      ])) {
        throw ModelError.localInvalidData();
      }
      return LocalFoldersModel(
        folders: json['folders'] != null
            ? (json['folders'] as List).map((final folder) => LocalFolderModel.fromJson(json: folder)).toList()
            : [],
      );
    } on ModelError {
      rethrow;
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  List<FolderEntity> toEntity() => folders.map((final folder) => folder.toEntity()).toList();

  Json toJson() => {
        'folders': folders.map((final folder) => folder.toJson()).toList(),
      };
}
