import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:testassignment/utils/constant.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    "https://b2c-api.flightlocal.com/graphql",
  );

  static HttpLink httpLinkToken = HttpLink(
    "https://b2c-api.flightlocal.com/graphql",
    defaultHeaders: {
      "Authorization" : spData.read(token),
    }
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

  GraphQLClient clientToQueryToken() {
    return GraphQLClient(
        link: httpLinkToken,
        cache: GraphQLCache()
    );
  }
}