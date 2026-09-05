// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graphql_example/datasources/country_remote_datasource.dart';
import 'package:graphql_example/models/country_model.dart';

class CountryRepo {
  CountryRemoteDatasource countryRemoteDatasource;
  CountryRepo({required this.countryRemoteDatasource});
  Future<List<CountryModel>?>? getAllCountries() async {
    final result = await countryRemoteDatasource.getAllCountries();
    return result;
  }
}
