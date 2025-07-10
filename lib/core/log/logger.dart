import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(),
    filter: ProductionFilter(),
  );
}