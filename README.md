<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Graph Analytics enables user to log navigator and methods
## Features

Graph Analytics enables user to log navigator and methods in few simple steps.

## Getting started

Add the package in pubspec.yaml and check below code.

## Usage


## Add below code in your **main.dart**
```dart
await GraphAnalytics.init(
    appCollectionId: "66614634-------491016ebc",
    id: "66608f1c-------9e5c11be8",
    accessToken:
    "W5qdrn61WUpZ3c0K0---------7BOaL83VswHCtOqxih7tUHhuc9z4VduYlGxGX",
    appAccessToken:
    "e5MA5hW0XCUCeBe15fKAaKdQHL---------JTMA5z5ZqkvGZF7M0QEbyDuLJb",
);
```


## You can log the navigation.
```dart
GraphAnalytics.logNavigation(from: "splashScreen",to: "homeScreen");
```

## You can log the method.
```dart
GraphAnalytics.logScreenInfo(screenName: "homeScreen", methodName: "buttonTapped");
GraphAnalytics.logScreenInfo(screenName: "homeScreen", methodName: "searchTapped");
```

## Additional information

For additional information contact us at nikhilishwar2@gmail.com. We welcome more contributors on this project. 