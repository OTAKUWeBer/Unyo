import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(methodCount: 9),
    level: Level.debug,
    // output: FileOutput(),
    filter: ProductionFilter(),
  );
}