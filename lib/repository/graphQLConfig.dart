import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    "https://b2c-api.flightlocal.com/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
        link: httpLink,
        cache: GraphQLCache()
    );
  }
}