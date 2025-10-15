import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/dialogs/widget/alert_dialog.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/user/user.dart';
import 'package:myapp/src/services/user_prefs.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState.ds()) {
    syncUserData();
  }

  StreamController<MUser> statusStream = StreamController.broadcast();
  DomainManager get domain => DomainManager();

  Future syncUserData() async {
    final String id = state.user.id;
    if (id.isNotEmpty == true) {
      final result = await domain.user.getUser(id);
      if (result.isSuccess) {
        onUserChange(state.copyWith(user: result.data));
      } else {
        onUserChange(state.logOut());
      }
    }
  }

  void onLoginSuccess(MUser user) {
    onUserChange(state.login(user));
  }

  void onEditProfileSuccess({required String name}) {
    onUserChange(
      state.copyWith(user: state.user.copyWith(name: name)),
    );
  }

  Future onLogOut(BuildContext context) async {
    final key = await XAlert.show(
      title: 'Logout',
      body: 'Are you sure you would like to logout?',
      actions: [
        XAlertButton(
          title: S.text.common_yes,
          isDestructiveAction: true,
          key: 'yes',
        ),
        XAlertButton(title: S.text.common_no),
      ],
    );
    if (key == 'yes') {
      domain.sign.logOut(state.user);
      onUserChange(state.logOut());
      return true;
    }
    return false;
  }

  Future onRemoveAccount(BuildContext context) async {
    final key = await XAlert.show(
      title: 'Remove Account',
      body:
          'Are you sure you would like to remove account? Your profile will be cleared',
      actions: [
        XAlertButton(
          title: S.text.common_yes,
          isDestructiveAction: true,
          key: 'yes',
        ),
        XAlertButton(title: S.text.common_no),
      ],
    );
    if (key == 'yes') {
      domain.sign.removeAccount(state.user);
      onUserChange(state.logOut());
      return true;
    }
    return false;
  }

  void onUserChange(AccountState newstate) {
    // setup token and param http
    UserPrefs.instance.setUser(newstate.user);
    emit(newstate);
  }
}
