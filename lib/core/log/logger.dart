import 'dart:io';

import 'package:logger/logger.dart';
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/di/locator.dart';

Logger getLogger() {
  Directory supportDirectory = sl<Directory>(instanceName: config.applicationSupportDirectory);
  File newLogFile = File('${supportDirectory.path}/logs/${DateTime.now().millisecondsSinceEpoch}.log');
  newLogFile.create(recursive: true);
  List<FileSystemEntity> logFiles = supportDirectory.listSync().where((file) => file.path.endsWith('.log')).toList();
  if (logFiles.length > 20) {
    logFiles.sort((a, b) => a.statSync().modified.compareTo(b.statSync().modified));
    for (int i = 0; i < logFiles.length - 20; i++) {
      logFiles[i].deleteSync();
    }
  }
  return Logger(
    printer: PrettyPrinter(methodCount: 15),
    level: Level.debug,
    output: MultiOutput([
      ConsoleOutput(),
      FileOutput(file: newLogFile, overrideExisting: true),
    ]),
    filter: ProductionFilter(),
  );
}