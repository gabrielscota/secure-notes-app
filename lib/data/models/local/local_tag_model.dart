import '../../../domain/entities/entities.dart' show TagEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;

class LocalTagModel {
  final String id;
  final String title;
  final String createdAt;
  final String updatedAt;

  LocalTagModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocalTagModel.fromJson({required final Json json}) {
    try {
      if (!json.keys.toSet().containsAll([
        'id',
        'title',
        'createdAt',
        'updatedAt',
      ])) {
        throw ModelError.localInvalidData();
      }
      return LocalTagModel(
        id: (json['id'] ?? '').toString(),
        title: (json['title'] ?? '').toString(),
        createdAt: (json['createdAt'] ?? '').toString(),
        updatedAt: (json['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  TagEntity toEntity() => TagEntity(
        id: id,
        title: title,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Json toJson() => {
        'id': id,
        'title': title,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
