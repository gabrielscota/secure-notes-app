import 'dart:convert';

import '../../../domain/entities/entities.dart' show UserEntity;
import '../errors/errors.dart' show ModelError;

class UserModel extends UserEntity {
  final String dtoId;
  final String dtoName;
  final String dtoEmail;

  const UserModel({
    required this.dtoId,
    required this.dtoName,
    required this.dtoEmail,
  }) : super(
          id: dtoId,
          name: dtoName,
          email: dtoEmail,
        );

  factory UserModel.fromJson({required final String json}) {
    try {
      final Map<String, dynamic> jsonDecoded = jsonDecode(json.isEmpty ? '{}' : json);
      if (!jsonDecoded.keys.toSet().containsAll([
        'id',
        'name',
        'email',
      ])) {
        throw ModelError.localInvalidData();
      }
      return UserModel(
        dtoId: (jsonDecoded['id'] ?? '').toString(),
        dtoName: (jsonDecoded['name'] ?? '').toString(),
        dtoEmail: (jsonDecoded['email'] ?? '').toString(),
      );
    } on ModelError {
      rethrow;
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  factory UserModel.fromDomain({required final UserEntity entity}) {
    try {
      return UserModel(
        dtoId: entity.id,
        dtoName: entity.name,
        dtoEmail: entity.email,
      );
    } catch (_) {
      throw ModelError.localParseData();
    }
  }

  Map<String, dynamic> toMap() => {
        'id': dtoId,
        'name': dtoName,
        'email': dtoEmail,
      };

  String toJson() => jsonEncode(toMap());
}
