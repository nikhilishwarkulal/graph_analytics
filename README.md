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

# Graph Analytics

**Graph Analytics** helps you effortlessly log screen navigations and method-level interactions within your Flutter app.

---

## ✨ Features

- Log user navigation between screens.
- Track method-level events within a screen (e.g., button taps, interactions).
- Easily integrate with just a few lines of code.

---

## 🚀 Getting Started

- Add this package to your `pubspec.yaml`.
- Follow the setup instructions below.

---

## Usage


## Add below code in your **main.dart**
To get your appCollectionId,id,accessToken,appAccessToken Visit https://analytics.pulsecode.in, and register.
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
To log navigation, provide both the from and to screen names.

For example, if you're navigating from the login screen to the home screen on a button tap, place the logging code just before **Navigator.push()**
```dart
GraphAnalytics.logNavigation(from: "splashScreen",to: "homeScreen");
```

## You can log the method.
You can track specific user interactions within a screen, such as button taps, text input, etc. Ensure that the screenName used here matches the one provided in logNavigation. Note: If the screen name is not logged using logNavigation, interaction tracking will not function.

Note: The screen name below should be as part of the logNavigation above

```dart
GraphAnalytics.logScreenInfo(screenName: "homeScreen", methodName: "buttonTapped");
GraphAnalytics.logScreenInfo(screenName: "homeScreen", methodName: "searchTapped");
```

Example use cases:

- OTP screen: `resendTapped`, `wrongOtpEntered`
- Profile screen: `termsClicked`, `logoutTapped`

## Additional information

For additional information contact us at pulsecode.tech@gmail.com. We welcome more contributors on this project. 