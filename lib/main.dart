import 'package:flutter/material.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';
import 'package:hacktable/servicelocator.dart';
import 'package:hacktable/themeconfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  createLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ignite',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: MyHomePage(),
      scrollBehavior: ScrollWithoutMaterialOverflowGlow(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Widget> _children = [];

    /// https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          NavigationBar(onTap: onTabTapped, currentIndex: _currentIndex),
    );
  }
}
