import 'dart:convert';

import '../../../domain/entities/entities.dart' show FolderEntity;
import '../errors/errors.dart' show ModelError;
import 'models.dart' show NoteModel;

class FolderModel extends FolderEntity {
  final String dtoId;
  final String dtoTitle;
  final String dtoDescription;
  final List<NoteModel> dtoNotes;
  final String dtoCreatedAt;
  final String dtoUpdatedAt;

  const FolderModel({
    required this.dtoId,
    required this.dtoTitle,
    required this.dtoDescription,
    required this.dtoNotes,
    required this.dtoCreatedAt,
    required this.dtoUpdatedAt,
  }) : super(
          id: dtoId,
          title: dtoTitle,
          description: dtoDescription,
          notes: dtoNotes,
          createdAt: dtoCreatedAt,
          updatedAt: dtoUpdatedAt,
        );

  factory FolderModel.fromMap({required Map<String, dynamic> map}) {
    try {
      if (!map.keys.toSet().containsAll([
        'id',
        'title',
        'description',
        'notes',
        'createdAt',
        'updatedAt',
      ])) {
        throw ModelError.localInvalidData();
      }
      return FolderModel(
        dtoId: (map['id'] ?? '').toString(),
        dtoTitle: (map['title'] ?? '').toString(),
        dtoDescription: (map['description'] ?? '').toString(),
        dtoNotes:
            map['notes'] != null ? (map['notes'] as List).map((note) => NoteModel.fromMap(map: note)).toList() : [],
        dtoCreatedAt: (map['createdAt'] ?? '').toString(),
        dtoUpdatedAt: (map['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  factory FolderModel.fromDomain({required FolderEntity entity}) {
    try {
      return FolderModel(
        dtoId: entity.id,
        dtoTitle: entity.title,
        dtoDescription: entity.description,
        dtoNotes: entity.notes.map((note) => NoteModel.fromDomain(entity: note)).toList(),
        dtoCreatedAt: entity.createdAt,
        dtoUpdatedAt: entity.updatedAt,
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  Map<String, dynamic> toMap() => {
        'id': dtoId,
        'title': dtoTitle,
        'description': dtoDescription,
        'notes': dtoNotes.map((note) => note.toMap()).toList(),
        'createdAt': dtoCreatedAt,
        'updatedAt': dtoUpdatedAt,
      };

  String toJson() => jsonEncode(toMap());
}
