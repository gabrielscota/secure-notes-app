import '../../../presentation/mixins/mixins.dart';

abstract class SplashPresenter {
  Stream<NavigationArguments> get navigateToWithArgsStream;

  Future<void> loadCurrentUser();
}
