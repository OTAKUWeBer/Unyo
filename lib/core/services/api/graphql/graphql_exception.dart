import 'graphql_error.dart';

class GraphQLException implements Exception {
  final List<GraphQLError> errors;

  GraphQLException(this.errors);

  @override
  String toString() => errors.map((e) => e.message).join('\n');
}