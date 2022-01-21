import '../helpers.dart';

enum UIError {
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
  emailInUse,
  weakPassword,
  invalidCpf,
  noError,
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return R.string.msgRequiredField;
      case UIError.invalidField:
        return R.string.msgInvalidField;
      case UIError.invalidCredentials:
        return R.string.msgInvalidCredentials;
      case UIError.emailInUse:
        return R.string.msgEmailInUse;
      case UIError.weakPassword:
        return R.string.msgWeakPassword;
      case UIError.invalidCpf:
        return R.string.msgInvalidCpf;
      case UIError.unexpected:
        return R.string.msgUnexpectedError;
      case UIError.noError:
        return '';
    }
  }
}
