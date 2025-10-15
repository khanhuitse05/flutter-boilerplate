# Morning Bird

## Table of contents

- [How to Use](#how-to-use)
- [Code Conventions](#code-conventions)
- [Git Conventions](#git-conventions)
- [dependencies](#Dependencies)

## Prerequisites

- Flutter 3.32.x
- Android Studio - [latest version](https://developer.android.com/studio/install?gclid=Cj0KCQjwiIOmBhDjARIsAP6YhSWAACh94FR8rU7TUR5My3O9zfbvsdcwq3MuupLn6QDGX5KUDQAv_l0aAjg1EALw_wcB&gclsrc=aw.ds)
- MacOS & XCode (for build & debug iOS)

## Link

- [Download Android]()
- [Download iOS]()
- [Link Web]()
- [Firebase console]()
- [Design Figma]()
- [Tasks - Trello]()
- [Source code - Gitlap]()

# How to Use

- **Step 1:** Download or clone this repo by using the link below:

  ```sh
  https://gitlab.com/
  ```

- **Step 2:** Install Flutter

  - Install the platform-specific SDK [here](https://flutter.dev/docs/get-started/install)

- **Step 3:** Setup flutter and run locally

  - Go to project root and execute the following command in console to get the required dependencies:

    ```sh
    flutter pub get
    ```

  - Connect your physical device or open simulator. then run your app
    ```sh
    flutter run
    ```

- **Step 4:**
  This project uses inject library that works with code generation, execute the following command to generate files (re-run every time you change one of these files)

      - Firstly, If you have not install flutter_gen yet. [Click here](https://pub.dev/packages/flutter_gen#installation)
      - Secondly, generate files for packages that use build_runner (auto_route, freezed...)
          ```sh
          flutter pub run build_runner build --delete-conflicting-outputs
          ```

- **Step 5:** Execute the following command to build app:

  ### Android:

  1. Change version and build number in `pubspec.yaml`

     ```
     flutter build appbundle
     ```

  2. Or run command line below to build with your build version

     ```
     flutter build appbundle --build-name=1.2.0 --build-number=2
     ```

  3. Access [Play console](https://play.google.com/console/u/0/developers) to create a new release and upload your build

  ### iOS

  1. Change version and build number in Xcode
  2. Access https://developer.apple.com/ to download profile and signing your app

  - **Manually:** Pod install then Open Xcode to deploy

    ```sh
    flutter build ios --release --no-codesign
    cd ios && pod install
    ```

    - Open XCode and deploy
    - On menu bar, select **Product** > **Archive** to build and deploy to TestFlight

  - **Use Fastlane:** run command bellow

    ```sh
    cd ios
    fastlane beta
    ```

## Code Conventions

- [analysis_options.yaml](analysis_options.yaml)
- [About code analytics flutter](https://medium.com/flutter-community/effective-code-in-your-flutter-app-from-the-beginning-e597444e1273)

  In Flutter, Modularization will be done at a file level. While building widgets, we have to make sure they stay independent and re-usable as maximum. Ideally, widgets should be easily extractable into an independent project.

- Must know
  - Model name start with `M`: MUser, MProduct, MGroup...
  - Common widget start with `X`: XButton, XText, XAppbar... - These widgets under folder `lib/widgets/`
  - App Constants class or service start with `Add`: AppStyles, AppColor, AppRouter, AppCoordinator,.. and UserPrefs


# Git Conventions
- [Git Versioning and Code Reviews](https://www.notion.so/jimmy9/Git-Versioning-and-Code-Reviews-dea414c5e38d4db7b36180e395843968)
- [Gitflow workflow](https://jimmy9.notion.site/Gitflow-workflow-414b8914b7e64a4d8198d47e6d9cc2f8?pvs=4)

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) A dart package that helps implement the BLoC pattern. Learn more at [bloclibrary.dev](https://bloclibrary.dev/#/)!

- [go_route](https://pub.dev/packages/go_route) It’s a Flutter navigation package

- [flutter_gen](https://pub.dev/packages/flutter_gen) The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.


## Screenshot
