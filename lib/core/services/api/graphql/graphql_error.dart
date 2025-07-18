class GraphQLError {
  final String message;
  final List<Map<String, dynamic>>? locations;

  GraphQLError({
    required this.message,
    this.locations,
  });

  factory GraphQLError.fromJson(Map<String, dynamic> json) {
    return GraphQLError(
      message: json['message'] ?? 'Unknown error',
      locations: (json['locations'] as List<dynamic>?)
          ?.cast<Map<String, dynamic>>(),
    );
  }
}