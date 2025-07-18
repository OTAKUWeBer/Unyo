import 'graphql_error.dart';

class ApiGraphQLResponse<T> {
  final T data;
  final List<GraphQLError>? errors;

  ApiGraphQLResponse({
    required this.data,
    this.errors,
  });

  factory ApiGraphQLResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJson,
      ) {
    return ApiGraphQLResponse(
      data: fromJson(json['data']),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => GraphQLError.fromJson(e))
          .toList(),
    );
  }
}