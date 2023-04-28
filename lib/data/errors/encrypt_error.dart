import '../../domain/helpers/helpers.dart' show DomainError, ErrorCode;

class EncryptError extends DomainError {
  EncryptError.decryptData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC01,
          message: message,
          payload: payload,
        );

  EncryptError.encryptData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC02,
          message: message,
          payload: payload,
        );

  EncryptError.generateKey({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC03,
          message: message,
          payload: payload,
        );
}
