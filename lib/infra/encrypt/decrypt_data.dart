import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import '../../data/encrypt/encrypt.dart';
import '../../data/errors/errors.dart';

class Chacha20DecryptData implements DecryptData {
  final Chacha20 algorithm;

  Chacha20DecryptData({
    required this.algorithm,
  });

  @override
  Future<String> decrypt({required final String text, required final String secretKey}) async {
    try {
      final List<int> _decrypted = await algorithm.decrypt(
        SecretBox.fromConcatenation(base64Decode(text), nonceLength: 12, macLength: 16),
        secretKey: SecretKey(base64Decode(secretKey)),
      );
      final String _decryptedText = utf8.decode(_decrypted);
      return _decryptedText;
    } on EncryptError {
      throw EncryptError.decryptData();
    }
  }
}
