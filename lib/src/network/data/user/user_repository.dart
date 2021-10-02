import 'package:my_app/src/network/models/common/result.dart';
import 'package:my_app/src/network/models/user.dart';

abstract class UserRepository {
  Future<XResult<XUser>> getUser(String id);
}
