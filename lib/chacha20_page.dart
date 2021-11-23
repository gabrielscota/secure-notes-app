import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';

class Chacha20Page extends StatefulWidget {
  const Chacha20Page({Key? key}) : super(key: key);

  @override
  _Chacha20PageState createState() => _Chacha20PageState();
}

class _Chacha20PageState extends State<Chacha20Page> {
  late Chacha20 algorithm;
  late SecretKey secretKey;
  late TextEditingController textEditingController;
  late List<int> encryptedTextBytes;
  late List<int> decryptedTextBytes;
  late String text;
  late bool isEncrypted;

  @override
  void initState() {
    algorithm = Chacha20.poly1305Aead();
    generateSecretKey();

    textEditingController = TextEditingController();
    text = '';
    encryptedTextBytes = [];
    decryptedTextBytes = [];

    isEncrypted = false;

    super.initState();
  }

  Future<void> generateSecretKey() async {
    secretKey = await algorithm.newSecretKey();
  }

  Future<void> encryptText() async {
    final SecretBox _encrypted = await algorithm.encrypt(
      textEditingController.text.codeUnits,
      secretKey: secretKey,
    );

    setState(() {
      isEncrypted = true;
      encryptedTextBytes = _encrypted.cipherText;
      text = base64Encode(_encrypted.concatenation());
    });
  }

  Future<void> decryptText() async {
    final List<int> _decrypted = await algorithm.decrypt(
      SecretBox.fromConcatenation(base64Decode(text), nonceLength: 12, macLength: 16),
      secretKey: secretKey,
    );

    setState(() {
      isEncrypted = false;
      decryptedTextBytes = _decrypted;
      text = utf8.decode(_decrypted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFCFCFC),
          padding: const EdgeInsets.all(24.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Chacha20',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 48.0),
              TextFormField(controller: textEditingController),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isEncrypted ? null : encryptText,
                      child: const Text('Encrypt'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isEncrypted ? decryptText : null,
                      child: const Text('Decrypt'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48.0),
              const Text(
                'Result:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Visibility(
                visible: isEncrypted,
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      'Encrypted Text Bytes:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            encryptedTextBytes.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !isEncrypted,
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      'Decrypted Text Bytes:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            decryptedTextBytes.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Base64 Encrypted Text:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPalette extends StatelessWidget {
  final Color color;

  const ColorPalette({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 32.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
