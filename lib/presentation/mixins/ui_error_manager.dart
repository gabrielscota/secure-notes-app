import 'package:get/state_manager.dart';

mixin UIErrorManager {
  final RxString _dialogError = RxString('');
  Stream<String> get dialogErrorStream => _dialogError.stream;
  set dialogError(final String value) => _dialogError.subject.add(value);

  final RxString _snackbarError = RxString('');
  Stream<String> get snackbarErrorStream => _snackbarError.stream;
  set snackbarError(final String value) => _snackbarError.subject.add(value);
}
