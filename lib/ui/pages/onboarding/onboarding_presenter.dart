import '../../helpers/helpers.dart';

abstract class OnboardingPresenter {
  Stream<UIError> get nameErrorStream;

  Future<void> saveUser();
}
