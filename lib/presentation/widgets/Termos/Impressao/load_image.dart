import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> loadImage(String path) async {
  final bytes = await rootBundle.load(path);
  return bytes.buffer.asUint8List();
}
