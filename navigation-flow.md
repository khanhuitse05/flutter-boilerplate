

> Apps accumulate dozens and then hundreds of routes over time. Some of your routes make sense as top-level (global) routes. For example, “/”, “profile”, “contact”, “social_feed” are all possible top-level routes within your app. But, imagine that you defined every possible route in your top-level Navigator widget. The list would be very long, and many of these routes would be better handled nested within another widget.

> When the product/design team is iterating a lot at the moment with the product. And they are going to change the order of flows and/or screen often. So we need to be prepared, and have a flexible system in order to be able to fit their needs.

## Objectives:
- We could change the order of the flows at any moment, really easily - Eg. SignUp - KYC/AML - SignIn - Deposit...
- We could change the order of the screens inside a flow, at any moment, really easily
- It needs to be scalable


## Prepare for navigation

This IoT app has two top-level screens, along with the setup flow. Define these route names as constants so that they can be referenced within code.

```
class SignUpRoutes {
  static const email = '/';
  static const password = '/signup/password';
  static const passwordRepeat = '/signup/passwordRepeat';
  static const routes = [email, password, passwordRepeat];
}
```

## Create abstract class BaseCoordinator
```
abstract class BaseCoordinator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String? screenName;
  String get initialRoute;
  List<String> get routes;

  @mustCallSuper
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    screenName = settings.name;
  }

  // make onStart static to avoid unnecessary creation
  // static Future? onStart();

  Future? onSubmit();
  
  Future? onExit(){
    Get.back();
  }

  Future? onNext() {
    final index = routes.indexOf(screenName ?? '');
    if (index < 0) {
      throw Exception(S.text.common_pageNotFound);
    } else {
      if (index == (routes.length - 1)) {
        return onSubmit();
      } else {
        final nextRouter = routes[index + 1];
        return navigatorKey.currentState!.pushNamed(nextRouter);
      }
    }
  }

  void onBack() {
    if (navigatorKey.currentState!.canPop()) {
      final index = routes.indexOf(screenName ?? '');
      if (index > 0) {
        screenName = routes[index - 1];
      }
      navigatorKey.currentState!.pop();
    } else {
      Get.back();
    }
  }

  Navigator getNavigator({String? customInitialRoute}) => Navigator(
        key: navigatorKey,
        initialRoute: customInitialRoute ?? initialRoute,
        onGenerateRoute: onGenerateRoute,
      );
}
```

- The `navigatorKey`: Use to navigation in the internal stack
- The `Coordinator` object will auto creation when start flow and remove when finish
- Call the static function `onStart` to enter the Flow
- The `onBack` function: Back to the previous step, or exit if the current is first step
- The `onNext` function: Go to the next step, or call `onSubmit` when the current is last step
- The `onExit` function: cancel the flow
- The `onSubmit` function: handle success flow


## Custom Coordinator and extends from BaseCoordinator

```
class SignInCoordinator extends BaseCoordinator {
  @override
  String get initialRoute => SignInRouters.email;
  @override
  List<String> get routes => [SignInRouters.email, SignInRouters.password];

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    super.onGenerateRoute(settings);
    final route = settings.name;
    switch (route) {
      case SignInRouters.email:
        return MaterialPageRoute(builder: (_) => SignInEmailScreen(), settings: settings);
      case SignInRouters.password:
        return MaterialPageRoute(builder: (_) => SignInPasswordScreen(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }

  @override
  Future? onSubmit() {
    return Get.offName(RouteNames.dashboard)
  }

  static Future? onStart() {
    return Get.toNamed(RouteNames.signinFlow);
  }
}

```

## Display an app bar for the setup flow

The setup flow displays a persistent app bar that appears across all pages.

Return a `Scaffold` widget from your `SetupFlow` widget’s `build()` method, and include the desired `AppBar` widget.

```
class SignInFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Get.find<SignInCoordinator>();
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(S.of(context).common_logIn),
        onBackPressed: router.onBack,
      ),
      body: Navigator(
        key: router.navigatorKey,
        initialRoute: router.initialRoute,
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}
```

