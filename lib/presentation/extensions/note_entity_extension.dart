import '../../domain/entities/entities.dart';
import '../../viewmodels/viewmodels.dart';

extension NoteEntityExtension on NoteEntity {
  NoteViewModel toViewModel() => NoteViewModel(
        id: id,
        title: title,
        text: text,
        isFavorite: isFavorite,
      );
}
