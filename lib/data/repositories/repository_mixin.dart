import 'package:unyo/core/services/api/graphql/graphql_exception.dart';
import 'package:unyo/core/services/api/graphql/graphql_response.dart' show ApiGraphQLResponse;

mixin RepositoryMixin {
  void throwIfGraphQlError<T>(ApiGraphQLResponse<T> graphQlResponse) {
    if (graphQlResponse.errors != null && graphQlResponse.errors!.isNotEmpty) {
      throw GraphQLException(graphQlResponse.errors!);
    }
  }
}