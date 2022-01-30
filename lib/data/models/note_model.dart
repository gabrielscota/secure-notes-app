import 'dart:convert';

import '../../../domain/entities/entities.dart' show NoteEntity;
import '../errors/errors.dart' show ModelError;
import 'models.dart' show TagModel;

class NoteModel extends NoteEntity {
  final String dtoId;
  final String dtoTitle;
  final String dtoText;
  final bool dtoIsFavorite;
  final List<TagModel> dtoTags;
  final String dtoCreatedAt;
  final String dtoUpdatedAt;

  const NoteModel({
    required this.dtoId,
    required this.dtoTitle,
    required this.dtoText,
    required this.dtoIsFavorite,
    required this.dtoTags,
    required this.dtoCreatedAt,
    required this.dtoUpdatedAt,
  }) : super(
          id: dtoId,
          title: dtoTitle,
          text: dtoText,
          isFavorite: dtoIsFavorite,
          tags: dtoTags,
          createdAt: dtoCreatedAt,
          updatedAt: dtoUpdatedAt,
        );

  factory NoteModel.fromMap({required final Map<String, dynamic> map}) {
    try {
      if (!map.keys.toSet().containsAll([
        'id',
        'title',
        'text',
        'isFavorite',
        'tags',
        'createdAt',
        'updatedAt',
      ])) {
        throw ModelError.localInvalidData();
      }
      return NoteModel(
        dtoId: (map['id'] ?? '').toString(),
        dtoTitle: (map['title'] ?? '').toString(),
        dtoText: (map['text'] ?? '').toString(),
        dtoIsFavorite: (map['isFavorite'] ?? false) as bool,
        dtoTags:
            map['tags'] != null ? (map['tags'] as List).map((final tag) => TagModel.fromMap(map: tag)).toList() : [],
        dtoCreatedAt: (map['createdAt'] ?? '').toString(),
        dtoUpdatedAt: (map['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  factory NoteModel.fromDomain({required final NoteEntity entity}) {
    try {
      return NoteModel(
        dtoId: entity.id,
        dtoTitle: entity.title,
        dtoText: entity.text,
        dtoIsFavorite: entity.isFavorite,
        dtoTags: entity.tags.map((final tag) => TagModel.fromDomain(entity: tag)).toList(),
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
        'text': dtoText,
        'isFavorite': dtoIsFavorite,
        'tags': dtoTags.map((final tag) => tag.toJson()).toList(),
        'createdAt': dtoCreatedAt,
        'updatedAt': dtoUpdatedAt,
      };

  String toJson() => jsonEncode(toMap());
}
