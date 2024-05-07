import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExtractData{

  late Database db;

  Future<Database> loadFromAsset() async {
    Directory documentsDirectory = await getApplicationCacheDirectory();
    String path = join(documentsDirectory.path, "hadith.db");
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets/db/', 'hadith_db.db'));
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    db = await openDatabase(path, version: 1,);
    return db;
  }
}