import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../utils/logger.dart';

class Storage {
  const Storage();

  Future<File?> pickFile({List<String>? extensions}) async {
    try {
      final picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
      );
      return (picked == null) ? null : File(picked.xFiles.first.path);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<File>> pickFiles({List<String>? extensions}) async {
    try {
      final picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
        allowMultiple: true,
      );
      return (picked == null) ? [] : picked.xFiles.map((e) => File(e.path)).toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
