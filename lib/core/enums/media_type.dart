class MediaTypeFactory {
  static MediaType fromString(String value) {
    switch (value) {
      case 'anime':
        return MediaType.anime;
      case 'manga':
        return MediaType.manga;
      default:
        throw ArgumentError('Unknown media type: $value');
    }
  }

}
enum MediaType {
  anime,
  manga,

}
