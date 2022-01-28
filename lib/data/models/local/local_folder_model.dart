import '../../../domain/entities/entities.dart' show FolderEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;
import 'local.dart' show LocalNoteModel;

class LocalFolderModel {
  final String id;
  final String title;
  final String description;
  final List<LocalNoteModel> notes;
  final String createdAt;
  final String updatedAt;

  LocalFolderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocalFolderModel.fromJson({required final Json json}) {
    try {
      if (!json.keys.toSet().containsAll([
        'id',
        'title',
        'description',
        'notes',
        'createdAt',
        'updatedAt',
      ])) {
        throw ModelError.localInvalidData();
      }
      return LocalFolderModel(
        id: (json['id'] ?? '').toString(),
        title: (json['title'] ?? '').toString(),
        description: (json['description'] ?? '').toString(),
        notes: json['notes'] != null
            ? (json['notes'] as List).map((final note) => LocalNoteModel.fromJson(json: note)).toList()
            : [],
        createdAt: (json['createdAt'] ?? '').toString(),
        updatedAt: (json['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  FolderEntity toEntity() => FolderEntity(
        id: id,
        title: title,
        description: description,
        notes: notes.map((final note) => note.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Json toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'notes': notes.map((final note) => note.toJson()).toList(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
