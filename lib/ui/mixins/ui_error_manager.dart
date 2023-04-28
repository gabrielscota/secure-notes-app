import '../components/components.dart';

mixin UIErrorManager {
  void handleDialogErrorStream({required Stream<String> stream}) {
    stream.listen((event) {
      if (event.isNotEmpty) {
        showDialogError(message: event);
      }
    });
  }

  void handleSnackbarErrorStream({required Stream<String> stream}) {
    stream.listen((event) {
      if (event.isNotEmpty) {
        showSnackbarError(message: event);
      }
    });
  }
}
