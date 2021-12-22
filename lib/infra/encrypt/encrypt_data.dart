import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import '../../data/encrypt/encrypt.dart';

class Chacha20EncryptData implements EncryptData {
  final Chacha20 algorithm;

  Chacha20EncryptData({
    required this.algorithm,
  });

  @override
  Future<String> encrypt({required String text, required String secretKey}) async {
    final SecretBox _encrypted = await algorithm.encrypt(
      Uint8List.fromList(utf8.encode(text)),
      secretKey: SecretKey(base64Decode(secretKey)),
    );
    final String _encryptedText = base64Encode(_encrypted.concatenation());
    return _encryptedText;
  }
}
