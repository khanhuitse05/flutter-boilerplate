import 'package:my_app/src/network/data/user/user_repository.dart';
import 'package:my_app/src/network/model/user.dart';
import 'package:my_app/src/network/model/common/result.dart';

class UserRepositoryMock extends UserRepository {
  @override
  Future<XResult<XUser>> getUser(String id) {
    throw UnimplementedError();
  }
}
