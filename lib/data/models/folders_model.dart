import 'dart:convert';

import '../../../domain/entities/entities.dart' show FoldersEntity;
import '../errors/errors.dart' show ModelError;
import 'models.dart' show FolderModel;

class FoldersModel extends FoldersEntity {
  final List<FolderModel> dtoFolders;

  const FoldersModel({
    required this.dtoFolders,
  }) : super(folders: dtoFolders);

  factory FoldersModel.fromJson({required final String json}) {
    try {
      final Map<String, dynamic> jsonDecoded = jsonDecode(json.isEmpty ? '{}' : json);
      if (!jsonDecoded.keys.toSet().containsAll([
        'folders',
      ])) {
        throw ModelError.localInvalidData();
      }
      return FoldersModel(
        dtoFolders: jsonDecoded['folders'] != null
            ? (jsonDecoded['folders'] as List).map((final folder) => FolderModel.fromMap(map: folder)).toList()
            : [],
      );
    } on ModelError {
      rethrow;
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  factory FoldersModel.fromDomain({required final FoldersEntity entity}) {
    try {
      return FoldersModel(
        dtoFolders: entity.folders.map((final folder) => FolderModel.fromDomain(entity: folder)).toList(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  Map<String, dynamic> toMap() => {
        'folders': dtoFolders.map((final folder) => folder.toJson()).toList(),
      };

  String toJson() => jsonEncode(toMap());
}
