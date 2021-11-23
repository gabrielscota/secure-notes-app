import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import '../../data/encrypt/encrypt.dart';

class Chacha20DecryptData implements DecryptData {
  final Chacha20 algorithm;

  Chacha20DecryptData({
    required this.algorithm,
  });

  @override
  Future<String> decrypt({required String text, required String secretKey}) async {
    final List<int> _decrypted = await algorithm.decrypt(
      SecretBox.fromConcatenation(base64Decode(text), nonceLength: 12, macLength: 16),
      secretKey: SecretKey(base64Decode(secretKey)),
    );
    final String _decryptedText = utf8.decode(_decrypted);
    return _decryptedText;
  }
}
