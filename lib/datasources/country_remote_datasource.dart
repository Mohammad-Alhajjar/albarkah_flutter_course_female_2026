import 'package:graphql_example/models/country_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryRemoteDatasource {
  GraphQLClient client = GraphQLClient(
    link: HttpLink("https://countries.trevorblades.com/graphql"),
    cache: GraphQLCache(store: InMemoryStore()),
  );

  Future<List<CountryModel>?> getAllCountries() async {
    try {
      final response = await client.query(
        QueryOptions(
          document: gql(CountriesQuery.allCountriesQuery),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );
      print(response.data);

      return List.generate(
        response.data!["countries"].length,
        (index) => CountryModel.fromMap(response.data!["countries"][index]),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class CountriesQuery {
  static String allCountriesQuery = r"""
query GetCountry {
  countries {
    name
    native
    capital
    emoji
    currency
    languages{
      name
    }
  }
}
""";
}
