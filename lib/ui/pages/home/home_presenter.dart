import '../../../presentation/mixins/mixins.dart';
import '../../../viewmodels/viewmodels.dart';

abstract class HomePresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;
  Stream<String> get snackbarErrorStream;
  Stream<bool> get isLoadingStream;

  // Notes
  Stream<List<NoteViewModel>> get allNotesStream;
  Stream<List<NoteViewModel>> get favoriteNotesStream;
  Future<void> fetchNotes();
  void addNote({required NoteViewModel note});

  void goToNotePage();
}
