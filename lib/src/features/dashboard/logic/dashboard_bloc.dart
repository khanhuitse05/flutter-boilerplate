import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'navigation_bar_item.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/services/remote_config/remote_config_service.dart';

class DashboardBloc extends Cubit<XNavigationBarItems> {
  DashboardBloc(super.current) {
    checkForceUpdate();
  }

  bool checkForceUpdate() {
    final needForceUpdate = RemoteConfigService.config.needForceUpdate;
    if (needForceUpdate) {
      XAlert.showForceUpdate();
      return true;
    }
    return false;
  }

  void onDestinationSelected(int index) {
    emit(XNavigationBarItems.values[index]);
    AppCoordinator.goNamed(state.route.name);
  }

  void goHome() {
    emit(XNavigationBarItems.home);
    AppCoordinator.goNamed(state.route.name);
  }
}
