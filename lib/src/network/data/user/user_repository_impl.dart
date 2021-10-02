import 'package:my_app/src/network/data/user/user_repository.dart';
import 'package:my_app/src/network/models/common/result.dart';
import 'package:my_app/src/network/models/user.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<XResult<XUser>> getUser(String id) {
    throw UnimplementedError();
  }
}
