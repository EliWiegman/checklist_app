// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'globals.dart' as globals;

/*void main() {
  runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const sampleText = "Hello world";
    return const MaterialApp(title: 'Checklist App', home: Test());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    const sampleText = "hello world";
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          // ignore: prefer_const_constructors
          child: Text(sampleText),
        )
        /*floatingActionButton: FloatingActionButton(
        //onPressed: break,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
        );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final items = globals.items;
  final sampleText = globals.sampleText;

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= items.length) {
            const stufftext = Text("hello world");
            items.addAll([
              Checkbox(", "),
              Checkbox("sjldfksdj"),
              Checkbox("jsflksdjf"),
              Checkbox("your mother"),
              Checkbox("jsflkdjfld")
            ]);
          }
          return _buildRow(items[index]);
        });
  }

  Widget _buildRow(Text text) {
    return ListTile(
      title: Text(
        text.toString(),
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist App'),
      ),
      body: _buildList(),
    );
  }
}
