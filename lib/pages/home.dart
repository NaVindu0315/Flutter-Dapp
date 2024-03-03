import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [Text('Welcome')],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Click')),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
