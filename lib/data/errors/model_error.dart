import '../../domain/helpers/helpers.dart' show DomainError, ErrorCode;

class ModelError extends DomainError {
  // TODO: Levar a mensagem para o presenter e somenta la fazer a tradução
  ModelError.remoteInvalidData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.RMO01,
          message: message,
          payload: payload,
        );

  ModelError.localInvalidData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.LMO01,
          message: message,
          payload: payload,
        );

  ModelError.remoteParseData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.RMO02,
          message: message,
          payload: payload,
        );

  ModelError.localParseData({String message = '', Map<String, dynamic> payload = const {}})
      : super(
          code: ErrorCode.LMO02,
          message: message,
          payload: payload,
        );
}
