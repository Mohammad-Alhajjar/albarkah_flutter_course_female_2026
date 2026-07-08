import 'package:rest_api_session_14/core/services/base_service.dart';
import 'package:rest_api_session_14/models/test_model.dart';

class TestService extends BaseService<TestModel>{
  @override
  Future<bool> create({required TestModel newItem}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete({required int deletedItemId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TestModel>?> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<TestModel?> getOne({required int itemId}) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<bool> update({required TestModel updatedItem}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}