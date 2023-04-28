import 'dart:convert';

import '../../../domain/entities/entities.dart' show TagEntity;
import '../errors/errors.dart' show ModelError;

class TagModel extends TagEntity {
  final String dtoId;
  final String dtoTitle;
  final String dtoCreatedAt;
  final String dtoUpdatedAt;

  const TagModel({
    required this.dtoId,
    required this.dtoTitle,
    required this.dtoCreatedAt,
    required this.dtoUpdatedAt,
  }) : super(
          id: dtoId,
          title: dtoTitle,
          createdAt: dtoCreatedAt,
          updatedAt: dtoUpdatedAt,
        );

  factory TagModel.fromMap({required Map<String, dynamic> map}) {
    try {
      if (!map.keys.toSet().containsAll([
        'id',
        'title',
        'createdAt',
        'updatedAt',
      ])) {
        throw ModelError.localInvalidData();
      }
      return TagModel(
        dtoId: (map['id'] ?? '').toString(),
        dtoTitle: (map['title'] ?? '').toString(),
        dtoCreatedAt: (map['createdAt'] ?? '').toString(),
        dtoUpdatedAt: (map['updatedAt'] ?? '').toString(),
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  factory TagModel.fromDomain({required TagEntity entity}) {
    try {
      return TagModel(
        dtoId: entity.id,
        dtoTitle: entity.title,
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
        'createdAt': dtoCreatedAt,
        'updatedAt': dtoUpdatedAt,
      };

  String toJson() => jsonEncode(toMap());
}
