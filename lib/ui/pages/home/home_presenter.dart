import '../../../presentation/mixins/mixins.dart';
import '../../../viewmodels/viewmodels.dart';

abstract class HomePresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;

  // Notes
  Stream<List<NoteViewModel>> get allNotesStream;
  void addNote({required final NoteViewModel note});

  void goToNotePage();
}
