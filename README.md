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

Onscreen Ui Debugger enables user to log on or print on screens
## Features

Onscreen Ui Debugger can  create logs on screen in few simple steps.

## Getting started

Add the package in pubspec.yaml and check below code.

## Usage


## Add below code to your MaterialApp.
```dart
builder: (context, child) {
    return Stack(
        children: [
            child ?? Container(),
            Overlay(
                initialEntries: [
                    OverlayEntry(
                        builder: (context) => const DebugWidget(),
                    ),
                ],
            ),
        ],
    );
},
```
After adding the above code your **MaterialApp** should like this.

```dart
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    ),
    //----------Changes starts from here ----------
    builder: (context, child) {
        return Stack(
            children: [
                child ?? Container(),
                Overlay(
                    initialEntries: [
                        OverlayEntry(
                        builder: (context) => const DebugWidget(),
                        ),
                    ],
                ),
            ],
        );
    },
    //----------Changes Ends here ----------
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
    )
```

## Below is the formate to log.
```dart
DebugLog debugLog = DebugLog(logTitle: "Login Rest Api", dateTime: DateTime.now());
debugLog.logStrings.add(DebugLogString(logTitle: "Login Request", logsDescription: "{mobile:'9496699210'}"));
debugLog.logStrings.add(DebugLogString(logTitle: "Response", logsDescription: '{message:'success'}'));
debugLog.setAsBlue(); // Tile color
DebugUtils.debugLogBloc.addDebugLog(debugLog);
```

## Additional information

For additional information contact us at nikhilishwar2@gmail.com. We welcome more contributors on this project. 