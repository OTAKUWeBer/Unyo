import 'package:k3vinb5_aniyomi_bridge/jmodels/jtrack.dart';

class Track {
  final String url;
  final String lang;
  final bool embedded;
  final int? embeddedIndex;

  const Track({
    required this.url,
    required this.lang,
    required this.embedded,
    this.embeddedIndex,
  });

  factory Track.fromJTrack(JTrack jTrack) {
    return Track(
        url: jTrack.getUrl().toDartString(),
        lang: jTrack.getLang().toDartString(),
        embedded: false
    );
  }
}