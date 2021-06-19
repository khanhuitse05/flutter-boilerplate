# Flutter boilerplate

<p align="center">
  <a href="https://flutter.io/">
    <img src="https://diegolaballos.com/files/images/flutter-icon.jpg" alt="Logo" width=72 height=72>
  </a>

  <h3 align="center">Flutter Boilerplate Project</h3>

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

## Table of contents

- [How to Use](#how-to-use)
- [Code Conventions](#code-conventions)
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

# Code Conventions
- [analysis_options.yaml](analysis_options.yaml)
- [about code analytis flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

In Flutter, Modularization will be done at a file level. While building widgets, we have to make sure they stay independent and re-usable as maximum. Ideally, widgets should be easily extractable into an independent project.


# Depencencies

![](resources/images/dependencies.jpg) 

## Helper
- [logger](https://pub.dev/packages/logger): Small, easy to use and extensible logger which prints beautiful logs.
- [url_launcher](https://pub.dev/packages/url_launcher): A Flutter plugin for launching a URL in the mobile platform. Supports iOS, Android, web, Windows, macOS, and Linux.
- [auto_route](https://pub.dev/packages/auto_route): Auto route generator, Manager router
- [get](https://pub.dev/packages/get): Snackbar, Navigation, Theme, Hellper function

- [intl](https://pub.dev/packages/intl): This package provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- [shared_preferences](https://pub.dev/packages/shared_preferences): Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.

`Other`: [hive](https://pub.dev/packages/hive), [sqflite](https://pub.dev/packages/sqflite)
- [package_info](https://pub.dev/packages/package_info)
- [device_info](https://pub.dev/packages/device_info)
- [permission_handler](https://pub.dev/packages/permission_handler): Permission plugin for Flutter. This plugin provides a cross-platform (iOS, Android) API to request and check permissions.

## HTTP, API
- [http](https://pub.dev/packages/http): A composable, Future-based library for making HTTP requests.

Besides, you can use one of the favorite package [DIO](https://pub.dev/packages/dio)

## Flutter Fire
The official Firebase plugins for Flutter. sign_in, analytics, crashlytics, storage, firestore
- [Flutter Fire](https://firebase.flutter.dev/)

## State Management

State Management is still the hottest topic in Flutter Community. There are tons of choices available and it’s super intimidating for a beginner to choose one. Also, all of them have their pros and cons. So, what’s the best approach

- [provider](https://pub.dev/packages/provider): **A recommended approach.
Other recommend**

Other favorite package
- [rxdart](https://pub.dev/packages/rxdart): RxDart adds additional capabilities to Dart Streams and StreamControllers. Using as bloc pattens
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Widgets that make it easy to integrate blocs and cubits into Flutter. [Learn more](https://bloclibrary.dev/#/) 
- [RiverPod](https://pub.dev/packages/riverpod): This project can be considered as a rewrite of provider to make improvements that would be otherwise impossible.
- [Get](https://pub.dev/packages/get): A simplified reactive state management solution.
- [stacked](https://pub.dev/packages/stacked): This architecture was initially a version of MVVM. 

![](resources/images/state.png) 

- [More about state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)

## Get package 
[get](https://pub.dev/packages/get)

- Utils
- Theme
- [State management](https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d)
- [Router management](https://pub.dev/packages/get#route-management)
- [Dependency management](https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9)


## Flutter Gen
- [flutter_gen](https://pub.dev/packages/flutter_gen): The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.

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


You code structure look like

![](resources/images/folder.png) 

## Wiki
Checkout [wiki](https://github.com/PingAk9/init-flutter/wiki) for more info

