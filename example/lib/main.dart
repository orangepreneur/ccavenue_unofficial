import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ccavenue_unofficial/ccavenue_unofficial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String newString = "";
  final _ccavenueUnofficialPlugin = CcavenueUnofficial();

  @override
  void initState() {
    super.initState();
    getStringFromPlugin();
  }

  Future<void> getStringFromPlugin() async {
    try {
      String nameString =
          await _ccavenueUnofficialPlugin.initiatePayment() ?? "Not Found";
      setState(() {
        newString = nameString;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $newString\n'),
        ),
      ),
    );
  }
}
