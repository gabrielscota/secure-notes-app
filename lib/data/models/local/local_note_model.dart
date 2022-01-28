import '../../../domain/entities/entities.dart' show NoteEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;
import 'local.dart' show LocalTagModel;

class LocalNoteModel {
  final String id;
  final String title;
  final String text;
  final bool isFavorite;
  final List<LocalTagModel> tags;
  final String createdAt;
  final String updatedAt;

  LocalNoteModel({
    required this.id,
    required this.title,
    required this.text,
    required this.isFavorite,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocalNoteModel.fromJson({required final Json json}) {
    try {
      if (!json.keys.toSet().containsAll([
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
      return LocalNoteModel(
        id: (json['id'] ?? '').toString(),
        title: (json['title'] ?? '').toString(),
        text: (json['text'] ?? '').toString(),
        isFavorite: (json['isFavorite'] ?? false) as bool,
        tags: json['tags'] != null
            ? (json['tags'] as List).map((final tag) => LocalTagModel.fromJson(json: tag)).toList()
            : [],
        createdAt: (json['createdAt'] ?? '').toString(),
        updatedAt: (json['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  NoteEntity toEntity() => NoteEntity(
        id: id,
        title: title,
        text: text,
        isFavorite: isFavorite,
        tags: tags.map((final tag) => tag.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Json toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'isFavorite': isFavorite,
        'tags': tags.map((final tag) => tag.toJson()).toList(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
