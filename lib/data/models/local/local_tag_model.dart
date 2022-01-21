import '../../../shared/shared.dart' show Json;

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

  Json toJson() => {
        'id': id,
        'title': title,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
