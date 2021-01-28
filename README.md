# Init Flutter

<p align="center">
  <a href="https://flutter.io/">
    <img src="https://diegolaballos.com/files/images/flutter-icon.jpg" alt="Logo" width=72 height=72>
  </a>

  <h3 align="center">Flutter Init Project</h3>

  <p align="center">
    Fork this project then start you project with a lot of stuck prepare
    <br>
    Base project made with much  :heart: . Contains CRUD, patterns, and much more!
    <br>
    <br>
    <a href="https://github.com/PingAK9/init-flutter/issues/new">Report bug</a>
    ·
    <a href="https://github.com/PingAK9/init-flutter/issues/new">Request feature</a>
  </p>
</p>

![](resources/images/folder.png) 

## Table of contents

- [How to Use](#how-to-use)
- [Depencencies](#depencencies)
- [Code structure](#code-structure)

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/PingAK9/init-flutter.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

# Depencencies

## Helper
- [logger](https://pub.dev/packages/logger)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [http](https://pub.dev/packages/http)
- [auto_route](https://pub.dev/packages/auto_route): Auto route generator, Manager router
- [get](https://pub.dev/packages/get): Snackbar, Navigation, Theme, Hellper function
- [http](https://pub.dev/packages/http)
- [intl](https://pub.dev/packages/intl)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [package_info](https://pub.dev/packages/package_info)
- [device_info](https://pub.dev/packages/device_info)
- [permission_handler](https://pub.dev/packages/permission_handler)

## social sign_in
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [flutter_twitter_login](https://github.com/Kiruel/flutter_twitter_login.git)
- [flutter_facebook_login](https://pub.dev/packages/flutter_facebook_login)
- [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple)

## Firebase: Storage & Cloud
- [firebase_analytics](https://pub.dev/packages/firebase_analytics)
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics)
- [firebase_messaging](https://pub.dev/packages/firebase_messaging)
- [firebase_storage](https://pub.dev/packages/firebase_storage)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)

## State Management
- [provider](https://pub.dev/packages/provider)

## Widget
- [shimmer](https://pub.dev/packages/shimmer): Shimmer loading animation
- [flutter_html](https://pub.dev/packages/flutter_html)
- [webview_flutter](https://pub.dev/packages/webview_flutter)

## Image
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager)



# Code structure
Here is the core folder structure which flutter provides.
```
flutter-app/
|- android
|- ios
|- lib
|- modules
|- test
```
Here is the folder structure we have been using in this project

```
lib/
|- code/
|- data/
|- _devmode/
  |- mock/
  |- view/
  |- widget/
|- services/
|- feature/
  |- dashboard/
    |- widget/
    |- controller
    |- dashboard_screen.dart
  |- home/
  |- login/
|- plugins/
|- routing/
|- shared/
  |- widget/
  |- controller/
  |- models/
  |- view/
|- main.dart
|- modules
```

Here is the folder structure of core modules in this project

```
ping9/
|- code/
|- dialog/
|- theme/
|- widget/
|- view/
```

Now, lets dive into the lib folder which has the main code for the application.

- **Config**: App Config
- **Models**: Models class
- **Routes**: Routers manager and auto route generator 
- **Services**: Dependency management and file controller
- **UI**: All the User Interface code files.
  - View: All the Screen file
  - Widget: Custom Widget
- **ViewModels**: MVVM pattern, Using [Stacked Package](https://pub.dev/packages/stacked) to implements

### Config
This directory contains/Config all the application level constants. A separate file is created for each type as shown in example below:
```
Config/
|- constants.dart
|- app_config.dart
|- device_info.dart
|- preferences.dart
|- content.dart
```

### Routes

This file contains all the routes for your application.
Using auto_router to generator Route setting and Router 

```dart
import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
```

### Services
All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories `local`, `network` and `shared_perf`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.
```
Services/
|- analytics_service.dart
|- authentication_service.dart
|- cloud_storage_service.dart
|- dialog_service.dart
|- firestore_service.dart
|- google_service.dart
|- shared_preference_service.dart
|- theme_service.dart
|- user_service.dart
```

### UI/View
This folder contains all the Screen for your application.

```
widgets/
|- Login
|- Signup
|- Player
| - ...
```

### UI/Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- form
|- block
|- button
| - ...
```

### viewmodels

The store is where all your application state lives in flutter. The Store is basically a widget that stands at the top of the widget tree and passes it's data down using special methods. In-case of multiple stores, a separate folder for each store is created as shown in the example below:

```
viewmodels/
|- player-viewmodel
|- manager-viewmodel
|- rating-viewmodel
|- login-viewmodel
|- user-viewmodel
|- squad-viewmodel
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
Using Get package for theme, navigation, snackbar ...

```dart
import 'package:boilerplate/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'ui/splash/splash.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
```

## Wiki
Checkout [wiki](https://github.com/PingAk9/init-flutter/wiki) for more info

