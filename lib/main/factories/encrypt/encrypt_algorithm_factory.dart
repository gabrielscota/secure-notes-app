import 'package:cryptography/cryptography.dart';

Chacha20 makeEncryptAlgorithm() => Chacha20.poly1305Aead();
