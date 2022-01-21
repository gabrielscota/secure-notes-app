import '../../../shared/shared.dart' show Json;
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
