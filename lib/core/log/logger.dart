import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(),
    level: Level.info,
    // output: FileOutput(),
    filter: ProductionFilter(),
  );
}