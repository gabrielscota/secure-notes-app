import '../../../presentation/mixins/mixins.dart';

abstract class HomePresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;

  void goToNotePage();
}
