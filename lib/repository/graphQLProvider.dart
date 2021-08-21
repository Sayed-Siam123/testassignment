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


  Future<TokenFreeListFetchModel> getHolidayList() async {
    Queries queries = Queries();

    GraphQLConfiguration graphQLConfiguration = new GraphQLConfiguration();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queries.getHolidayListQuery()),
      ),
    );

    print(result.data["getPackages"]["message"]);
    print(result.data["getPackages"]["result"]["count"].toString());
    print(result.data);
    return TokenFreeListFetchModel.fromMap(result.data);
  }

  /*_write(String text) async {
    final Directory directory = await getExternalStorageDirectory();
    print(directory.path);
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(json.encode(text));
  }*/
}