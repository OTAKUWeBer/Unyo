import 'package:k3vinb5_aniyomi_bridge/jmodels/jheaders.dart';

class Headers {
  final Map<String, String> headersMap;

  const Headers({required this.headersMap});

  factory Headers.fromJHeaders(JHeaders? jHeaders) {
    if (jHeaders == null) {
      return const Headers(headersMap: {});
    }
    return Headers(
      headersMap: jHeaders.toMultimap().map((key, value) => MapEntry(key.toDartString(), value.join(","))),
    );
  }
}
