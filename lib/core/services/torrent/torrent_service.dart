import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:system_info3/system_info3.dart';

class TorrentService {
  static const String _servicesDir = "services";
  static const String _torrServerDir = "torrserver";
  static const String _torrentServerName = "torrserver";
  static const String _packageAssetsDir = "assets";

  TorrentService() {
    initTorrentServer();
  }

  Future<void> initTorrentServer() async {
    Directory supportDirectory = await getApplicationSupportDirectory();
    _loadTorrServerIfNeeded(supportDirectory);
  }

  Future<void> _loadTorrServerIfNeeded(Directory supportDirectory) async {
    String torrentServerPath = path.join(
      supportDirectory.path,
      _torrServerDir,
      _torrentServerName + (Platform.isWindows ? ".exe" : ""),
    );
    File aniyomiBridgeCore = File(torrentServerPath);
    if (!(await aniyomiBridgeCore.exists())) {
      await _copyAssetToFile(
        "$_packageAssetsDir/$_servicesDir/$_torrentServerName/${SysInfo.kernelArchitecture == ProcessorArchitecture.x86_64 ? "amd64" : "arm64"}/${Platform.operatingSystem}/${_torrentServerName + (Platform.isWindows ? ".exe" : "")}",
        torrentServerPath,
      );
    }
  }

  Future<File> _copyAssetToFile(String assetPath, String outPath) async {
    final byteData = await rootBundle.load(assetPath);
    final buffer = byteData.buffer.asUint8List();
    final file = File(outPath);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(buffer, flush: true);
    return file;
  }
}
