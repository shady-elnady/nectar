// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:path/path.dart';

class FileSystemManager {
  static final FileSystemManager _instance = FileSystemManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory FileSystemManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  FileSystemManager._internal() {
    // initialization logic
  }

  // rest of class as normal, for example:
  void openFile() {}
  void writeFile() {}

//  static copy(String toPath) async {
//     /**
//      *  must Add Android Perrmissions
//         <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//         <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
//      */
//     ByteData fileData = await rootBundle.load(join('assets', 'quran.db'));
//     List<int> bytes = fileData.buffer
//         .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
//     await File(toPath).writeAsBytes(bytes);
//   }
}
