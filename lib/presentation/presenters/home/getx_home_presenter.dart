import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../../../viewmodels/viewmodels.dart';
import '../../extensions/extensions.dart';
import '../../mixins/mixins.dart';

class GetxHomePresenter extends GetxController
    with LoadingManager, NavigationManager, UIErrorManager
    implements HomePresenter {
  final FetchFoldersUseCase fetchFoldersUseCase;

  GetxHomePresenter({
    required this.fetchFoldersUseCase,
  });

  final RxList<NoteViewModel> _allNotes = RxList.empty();
  @override
  Stream<List<NoteViewModel>> get allNotesStream => _allNotes.stream;

  final RxList<NoteViewModel> _favoriteNotes = RxList.empty();
  @override
  Stream<List<NoteViewModel>> get favoriteNotesStream => _favoriteNotes.stream;

  @override
  Future<void> fetchNotes() async {
    try {
      isLoading = true;
      final FoldersEntity folders = await fetchFoldersUseCase.call();
      // TODO: Remover loading futuramente
      await Future.delayed(const Duration(seconds: 1));
      final List<NoteViewModel> notesViewModel = [];
      for (final folder in folders.folders) {
        notesViewModel.addAll(folder.toViewModel().notes);
      }
      isLoading = false;
      await Future.delayed(const Duration(milliseconds: 100));
      _allNotes.addAll([]);
      _favoriteNotes.addAll(notesViewModel.where((note) => note.isFavorite));
    } on DomainError catch (error) {
      isLoading = false;
      await Future.delayed(const Duration(milliseconds: 100));
      _allNotes.subject.addError(error, StackTrace.empty);
      snackbarError = '${error.message} [${error.code.name}]';
    }
  }

  @override
  void addNote({required NoteViewModel note}) {
    _allNotes.add(note);
  }

  @override
  void goToNotePage() {
    navigateToWithArgs = NavigationArguments(
      route: Routes.note,
      arguments: {
        'addNoteFunction': addNote,
      },
    );
  }
}
