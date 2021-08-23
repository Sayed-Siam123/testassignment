import 'dart:convert';
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:testassignment/model/TokenFreeListFetchModel.dart';
import 'package:testassignment/repository/GraphQLConfig.dart';
import 'package:testassignment/repository/query.dart';

class GraphQLProvider{

  /*Future<CategoryItemModel> getCategoryItemList({id}) async {
    Queries queryMutation = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queryMutation.getAllCategoryItem(id: id)),
      ),
    );

    print(result.data);
    return CategoryItemModel.fromMap(result.data);

    //print(result.data);
    //_write(result.data.toString());

  }

  Future<CreateCartId> createCartID() async{
    Queries queryMutation = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queryMutation.createEmptyCart()),
      ),
    );

    print(json.encode(result.data));

    return CreateCartId.fromMap(result.data);
  }*/


  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();


  Future<TokenFreeListFetchModel> getHolidayList() async {
    Queries queries = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.getHolidayListQuery()),
      ),
    );
    var jsonData = json.encode(result.data);
    log(jsonData);
    return TokenFreeListFetchModel.fromMap(json.decode(jsonData));
  }


  Future<TokenFreeListFetchModel> getHolidayListwithPagination({skip,limit}) async {
    Queries queries = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.getHolidayListQueryWithPagination(skip: skip,limit: limit)),
      ),
    );
    var jsonData = json.encode(result.data);
    log(jsonData);
    return TokenFreeListFetchModel.fromMap(json.decode(jsonData));
  }

  Future<dynamic> login() async {
    Queries queries = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.loginQuery()),
      ),
    );
    var jsonData = json.encode(result.data);
    //log(jsonData);
    return jsonData;
  }

  Future<TokenFreeListFetchModel> getHolidayListWithDiscount() async {
    Queries queries = Queries();

    GraphQLClient _client = graphQLConfiguration.clientToQueryToken();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.getHolidayListQuery()),
      ),
    );
    var jsonData = json.encode(result.data);
    log(jsonData);
    return TokenFreeListFetchModel.fromMap(json.decode(jsonData));
  }

  /*_write(String text) async {
    final Directory directory = await getExternalStorageDirectory();
    print(directory.path);
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(json.encode(text));
  }*/
}