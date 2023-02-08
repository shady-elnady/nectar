// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:path/path.dart';

// class FilesHelper {
//   static copy(String toPath) async {
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
// }
