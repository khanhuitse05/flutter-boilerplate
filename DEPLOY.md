# Template Flutter Project Deploy document
# Deploy for Android
## Deploy Firebase App Distribution 
- [Link firebase Distribute](https://console.firebase.google.com/project/yourapp/appdistribution/)
   - Contact client@gmail.com for access to Firebase

### Manually
1. Create an appbunlde
   - Running the following at the command line:
      ```
         flutter build apk
      ```

2. Go to the Firebase Distribution and and upload your APK file
3. Download and Check if build is stable.
4. Update release notes and release to other testers.
5. Announce new build with release notes in Slack channel.

### Via CircleCI
1. Create sit-android branch from develop, any branch that starts with sit-android/. e.g., sit-android/2.3.0, sit-android/2.3.1
2. Make sure version is correct. Will use current version in project. Build number will auto-increment based from firebase last build
3. Push branch. This will trigger job in CircleCI.
4. Wait to be uploaded in Firebase. Will auto add Engineers as testers.
5. Check if build is stable.
6. Update release notes and release to other testers.
7. Announce new build with release notes in Slack channel.

## Deploy to Google Play Console
- [Link Google Play Console](https://play.google.com/apps/publish)
   - Contact client@gmail.com for access to Google Play Console

### Manually
You go to the production page of the app on the Google Play Console
1. Create an appbunlde
   - Running the following at the command line:
      ```
         flutter build appbunlde
      ```
   Make sure version is correct. Will use current version in project. 
2. Upload the build to beta testing

### Via CircleCI
1. Create release-android branch from develop, any branch that starts with release-android/. e.g., release-android/2.3.0, release-android/2.3.1
2. Make sure version is correct. Will use current version in project. Build number will auto-increment based from firebase last build
3. Push branch. This will trigger job in CircleCI.
4. Wait to be uploaded in Google Play Console.

# Deploy for iOS
## 1. Signing

- Contact client@gmail.com for access to Developer & Appstore account
- Running the following at the command line for auto signing:
   ```
   fastlane sync_signing_sit
   ```
   or 
   ```
   fastlane sync_signing_prod
   ```
- Or you can setup manually

## 2. Deploy to Firebase App Distribution 
### Manually

1. Running the following at the command line to sync your code:
      ```
         flutter build ios --release --no-codesig
      ```

2. Open Xcode, export your IPA file & upload to Direbase Distribute
3. Download and Check if build is stable.
4. Update release notes and release to other testers.
5. Announce new build with release notes in Slack channel.

### Via CircleCI
1. Create sit-ios branch from develop, any branch that starts with sit-ios/. e.g., sit-ios/2.3.0, sit-ios/2.3.1
2. Make sure version is correct. Will use current version in project. Build number will auto-increment based from firebase last build
3. Push branch. This will trigger job in CircleCI.
4. Wait to be uploaded in Firebase. Will auto add iOS Engineers as testers.
5. Check if build is stable.
6. Update release notes and release to other testers.
7. Announce new build with release notes in Slack channel.

## 2. Deploy to TestFlight 
### Manually

1. Running the following at the command line to sync your code:
      ```
         flutter build ios --release --no-codesig
      ```

2. Open Xcode, and submit your app to app store
3. Download and Check if build is stable.
4. Update release notes and release to other testers.
5. Announce new build with release notes in Slack channel and wait for tester verify.

### Via CircleCI
1. Create release-ios branch from develop, any branch that starts with release-ios/. e.g., release-ios/2.3.0, release-ios/2.3.1
2. Make sure version is correct. Will use current version in project. Build number will auto-increment based from firebase last build
3. Push branch. This will trigger job in CircleCI.
4. Wait to be uploaded
5. Check if build is stable.
6. Update release notes and release to other testers.
7. Announce new build with release notes in Slack channel and wait for tester verify..