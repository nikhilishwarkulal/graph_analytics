import 'package:flutter/material.dart';
import 'package:graph_analytics/analytics.dart';

void main() {
  GraphAnalytics.init(
    appCollectionId: "65c901dbb290ae395ea13afa",
    id: "65c62ed41ad47b6daa7e368e",
    accessToken:
        "cvhxG38XWf5IJgLrSpIqr8vR2MhTLCVo2vShzCmG0AVPvP5NKKuUeq1qnWN3IL5g",
    appAccessToken:
        "asOnNAeaKchqSZ69HPkXxZmg96gTeQV7obICJo3PDlCHAvYxnLjwNb3W6D87KVWO",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    GraphAnalytics.logNavigation(from: "myHomePage", to: "profilePage");
    await Navigator.pushNamed(context, "profilePage");
    GraphAnalytics.logNavigation(from: "profilePage", to: "myHomePage");
    GraphAnalytics.logNavigation(from: "profilePage", to: "imageUpload");
    GraphAnalytics.logNavigation(from: "imageUpload", to: "profilePage");
    GraphAnalytics.logNavigation(from: "imageUpload", to: "deleteScreen");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
