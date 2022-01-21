import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import '../../data/encrypt/encrypt.dart';
import '../../data/errors/errors.dart';

class Chacha20GenerateKey implements EncryptGenerateKey {
  final Chacha20 algorithm;

  Chacha20GenerateKey({
    required this.algorithm,
  });

  @override
  Future<String> generate() async {
    try {
      final SecretKey _secretKey = await algorithm.newSecretKey();
      final List<int> _secretKeyBytes = await _secretKey.extractBytes();
      final String _secretKeyText = base64Encode(_secretKeyBytes);
      return _secretKeyText;
    } on EncryptError {
      throw EncryptError.decryptData();
    }
  }
}
