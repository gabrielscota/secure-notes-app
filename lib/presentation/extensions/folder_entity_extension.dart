import '../../domain/entities/entities.dart';
import '../../viewmodels/viewmodels.dart';
import 'extensions.dart';

extension FolderEntityExtension on FolderEntity {
  FolderViewModel toViewModel() => FolderViewModel(
        id: id,
        title: title,
        description: description,
        notes: notes.map((note) => note.toViewModel()).toList(),
      );
}
