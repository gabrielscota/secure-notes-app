import '../../domain/helpers/helpers.dart' show DomainError, ErrorCode;

class EncryptError extends DomainError {
  EncryptError.decryptData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC01,
          message: message,
          payload: payload,
        );

  EncryptError.encryptData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC02,
          message: message,
          payload: payload,
        );

  EncryptError.generateKey({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.ENC03,
          message: message,
          payload: payload,
        );
}
