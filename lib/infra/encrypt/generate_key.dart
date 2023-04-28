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
      final SecretKey secretKey = await algorithm.newSecretKey();
      final List<int> secretKeyBytes = await secretKey.extractBytes();
      final String secretKeyText = base64Encode(secretKeyBytes);
      return secretKeyText;
    } on EncryptError {
      throw EncryptError.decryptData();
    }
  }
}
