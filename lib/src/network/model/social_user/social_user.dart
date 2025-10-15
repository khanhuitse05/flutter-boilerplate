import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/src/network/model/social_type.dart';

part 'social_user.freezed.dart';
part 'social_user.g.dart';

@freezed
abstract class MSocialUser with _$MSocialUser {
  const factory MSocialUser({
    required MSocialType type,

    /// Apple and Facebook userID
    String? userID,

    /// Facebook & Google Access Token
    String? accessToken,

    /// Google ID Token
    String? idToken,

    /// FB and Google information
    String? fullName,
    String? email,
    String? avatar,
    String? birthDate,
    int? gender,
    String? phone,
  }) = _MSocialUser;

  factory MSocialUser.fromJson(Map<String, Object?> json) =>
      _$MSocialUserFromJson(json);

  factory MSocialUser.fromGoogleAccount(
    GoogleSignInAccount account,
    String accessToken,
  ) {
    return MSocialUser(
      type: MSocialType.google,
      fullName: account.displayName,
      email: account.email,
      avatar: account.photoUrl,
      accessToken: accessToken,
      idToken: account.authentication.idToken,
    );
  }

  // factory NSocialUser.fromAppleAccount(AuthorizationCredentialAppleID credential) {
  //   return NSocialUser(
  //     type: NSocialType.apple,
  //     userID: credential.userIdentifier,
  //     fullName: Utils.fullnameOf(credential.givenName, credential.familyName),
  //     email: credential.email,
  //   );
  // }

  // factory NSocialUser.fromFacebookAccount(Map<String, dynamic> userData, AccessToken token) {
  //   return NSocialUser(
  //     type: NSocialType.facebook,
  //     fullName: userData['name'],
  //     email: userData['email'],
  //     userID: token.userId,
  //     fbAccessToken: token.token,
  //     avatar: ((userData['picture'] ?? {})['data'] ?? {})['url'] ?? '',
  //   );
  // }
}
