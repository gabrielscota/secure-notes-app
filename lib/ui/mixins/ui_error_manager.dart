import '../components/components.dart';

mixin UIErrorManager {
  void handleDialogErrorStream({required final Stream<String> stream}) {
    stream.listen((final event) {
      if (event.isNotEmpty) {
        showDialogError(message: event);
      }
    });
  }

  void handleSnackbarErrorStream({required final Stream<String> stream}) {
    stream.listen((final event) {
      if (event.isNotEmpty) {
        showSnackbarError(message: event);
      }
    });
  }
}
