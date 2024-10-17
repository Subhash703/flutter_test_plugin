import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test_plugin/flutter_test_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _messageFromPlugin = 'Unknown';
  final _flutterTestPlugin = FlutterTestPlugin();

  @override
  void initState() {
    super.initState();
    _messageFromPlugin = _flutterTestPlugin.testFunction();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: Text("Message : ${_messageFromPlugin}"),
        ),
      ),
    );
  }
}
