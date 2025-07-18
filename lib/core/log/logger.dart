import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
    // output: FileOutput(),
    filter: ProductionFilter(),
  );
}