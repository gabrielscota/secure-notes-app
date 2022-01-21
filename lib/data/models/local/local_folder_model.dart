import '../../../shared/shared.dart' show Json;
import 'local.dart' show LocalNoteModel;

class LocalFolderModel {
  final String id;
  final String title;
  final String description;
  final List<LocalNoteModel> notes;
  final bool isSafe;
  final String createdAt;
  final String updatedAt;

  LocalFolderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.notes,
    required this.isSafe,
    required this.createdAt,
    required this.updatedAt,
  });

  Json toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'notes': notes.map((final note) => note.toJson()).toList(),
        'isSafe': isSafe,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
