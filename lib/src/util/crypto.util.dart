import 'package:encrypt/encrypt.dart';

import 'util.dart';

class CryptoUtil extends Util {
  final _key = Key.fromUtf8('CRM134743777217A24432646294A404E');
  final _iv = IV.fromLength(16);

  Encrypter get _crypto => Encrypter(AES(_key));

  String decrypt(String cipherText) => _crypto.decrypt64(cipherText, iv: _iv);

  String encrypt(String plainText) =>
      _crypto.encrypt(plainText, iv: _iv).base64;
}
