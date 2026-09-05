import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_example/datasources/country_remote_datasource.dart';
import 'package:graphql_example/repositories/country_repo.dart';

final countryRemoteDatasourceProvider = Provider(
  (ref) => CountryRemoteDatasource(),
);

final countryRepo = Provider((ref) {
  final countryDatasource = ref.read(countryRemoteDatasourceProvider);
  return CountryRepo(countryRemoteDatasource: countryDatasource);
});

final countriesProvider = FutureProvider((ref) async {
  final countryRespositroy = ref.read(countryRepo);
  final result = await countryRespositroy.getAllCountries();
  if (result == null) {
    throw Exception("failed to fetch data ... ");
  }
  return result;
});
