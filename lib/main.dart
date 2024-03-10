import 'package:flutter/material.dart';
import 'package:flutter_dapp/pages/home.dart';
import 'package:flutter_dapp/simple_dapp/Homes.dart';
import 'package:flutter_dapp/voting/votingclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homes(),
    );
  }
}
