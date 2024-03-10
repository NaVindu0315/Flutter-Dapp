import 'package:flutter/material.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DAPP'),
        ),
        body: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
