import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/user.dart';

abstract class UserRepository {
  Future<XResult<XUser>> getUser(String id);
}
