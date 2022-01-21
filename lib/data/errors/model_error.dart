import '../../domain/helpers/helpers.dart' show DomainError, ErrorCode;

class ModelError extends DomainError {
  // TODO(Gabriel): Levar a mensagem para o presenter e somenta la fazer a tradução
  ModelError.remoteInvalidData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.RMO01,
          message: message,
          payload: payload,
        );

  ModelError.localInvalidData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.LMO01,
          message: message,
          payload: payload,
        );

  ModelError.remoteParseData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.RMO02,
          message: message,
          payload: payload,
        );

  ModelError.localParseData({final String message = '', final Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.LMO02,
          message: message,
          payload: payload,
        );
}
