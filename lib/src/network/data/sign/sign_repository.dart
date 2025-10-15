import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/social_user/social_user.dart';
import 'package:myapp/src/network/model/user/user.dart';

abstract class SignRepository {
  // Login with Email
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password});

  // Login via SDK
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser user);
  Future<MResult<MUser>> connectBEWithFacebook(MSocialUser user);
  Future<MResult<MUser>> connectBEWithApple(MSocialUser user);

  // Connect after login with SDK Success
  Future<MResult<MSocialUser>> loginWithGoogle();
  Future<MResult<MSocialUser>> loginWithFacebook();
  Future<MResult<MSocialUser>> loginWithApple();

  // Sign up with email
  Future<MResult<MUser>> signUpWithEmail(
      {required String email, required String password, required String name});

  Future<MResult<String>> forgotPassword(String email);

  /// Logout
  Future<MResult> logOut(MUser user);

  /// removeAccount
  Future<MResult> removeAccount(MUser user);
}
