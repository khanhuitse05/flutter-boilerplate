import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/user/user.dart';
import 'package:myapp/src/network/model/social_user/social_user.dart';

class SignRepositoryImpl extends SignRepository {
  // https://isaacadariku.medium.com/google-sign-in-flutter-migration-guide-pre-7-0-versions-to-v7-version-cdc9efd7f182
  // https://pub.dev/packages/google_sign_in/changelog#700
  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;
  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      debugPrint('Failed to initialize Google Sign-In: $e');
    }
  }

  /// Always check Google sign in initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<String?> getAccessTokenForScopes(List<String> scopes) async {
    await _ensureGoogleSignInInitialized();

    try {
      final authClient = _googleSignIn.authorizationClient;
      // Try to get existing authorization
      var authorization = await authClient.authorizationForScopes(scopes);
      authorization ??= await authClient.authorizeScopes(scopes);
      return authorization.accessToken;
    } catch (error) {
      debugPrint('Failed to get access token for scopes: $error');
      return null;
    }
  }

  @override
  Future<MResult<MUser>> connectBEWithApple(MSocialUser user) {
    // TODO: implement connectBEWithApple
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> connectBEWithFacebook(MSocialUser user) {
    // TODO: implement connectBEWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> connectBEWithGoogle(MSocialUser user) async {
    try {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: user.accessToken, idToken: user.idToken);
      // Once signed in, return the UserCredential
      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseUser = result.user;
      final newUser = MUser(
        id: firebaseUser?.uid ?? '',
        email: user.email,
        name: user.fullName,
      );
      final userResult = await DomainManager().user.getOrAddUser(newUser);

      return MResult.success(userResult.data ?? newUser);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<String>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<MResult> logOut(MUser user) async {
    try {
      await FirebaseAuth.instance.signOut();
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MSocialUser>> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<MResult<MUser>> loginWithEmail(
      {required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<MResult<MSocialUser>> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<MResult<MSocialUser>> loginWithGoogle() async {
    try {
      const scopes = ['email'];
      await _ensureGoogleSignInInitialized();
      final GoogleSignInAccount googleUser =
          await _googleSignIn.authenticate(scopeHint: scopes);
      final accessToken = await getAccessTokenForScopes(scopes);
      if (accessToken == null) {
        return MResult.error('Failed to get access token');
      }
      // googleUser
      return MResult.success(
          MSocialUser.fromGoogleAccount(googleUser, accessToken));
    } catch (error) {
      return MResult.exception(error);
    }
  }

  @override
  Future<MResult> removeAccount(MUser user) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      user?.delete();
      return MResult.success(user);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  @override
  Future<MResult<MUser>> signUpWithEmail(
      {required String email, required String password, required String name}) {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }
}
