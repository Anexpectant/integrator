import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/logger/logger.dart';

@Injectable(env: [Environment.dev], order: -1)
class LocalDataSource {
  init() async {
    final watch = Stopwatch()..start();
    await exec();
    getIt<Logger>().debug('elapsed time of init: ${watch.elapsed.inSeconds}');
  }

  Future<Uint8List?> getStorageKey() async {
    if (kIsWeb) return null;
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    String? encodedKey = await secureStorage.read(key: 'key');
    Uint8List encryptionKey = base64Url.decode(encodedKey!);
    return encryptionKey;
  }

  Future<Box<T>> openEncryptedBox<T>(String boxName) async {
    if (kIsWeb) return Future.value(Hive.openBox<T>(boxName));
    return Future.value(Hive.openBox<T>(boxName,
        encryptionCipher: HiveAesCipher((await getStorageKey())!)));
  }

  exec() {}
}
