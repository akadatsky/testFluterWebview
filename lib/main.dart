import 'package:flutter/material.dart';
import 'package:test_webview/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'TestButton',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () => _buttonPressed(),
            ),
          ],
        ),
      ),
    );
  }

  void _buttonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TestScreen()),
    );
  }
}
