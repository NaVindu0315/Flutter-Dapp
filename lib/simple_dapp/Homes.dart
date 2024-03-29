import 'package:flutter/material.dart';
import 'package:flutter_dapp/simple_dapp/widgetbuttoncontainer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DAPP'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.deepPurple..withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          'Current Blaance',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SfSlider(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                interval: 1,
                activeColor: Colors.deepPurpleAccent,
                enableTooltip: true,
                stepSize: 1.0,
                showLabels: true,
                min: 0.0,
                max: 10.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomContainerButtonWidget(
                  title: "Get Balance",
                  color: Colors.green,
                  onTap: () {
                    incorrectValueDialogBox(context);
                  }),
              SizedBox(
                height: 10.0,
              ),
              CustomContainerButtonWidget(
                  title: "Withdraw Balance", color: Colors.red, onTap: () {}),
              SizedBox(
                height: 10.0,
              ),
              CustomContainerButtonWidget(
                  title: "Send", color: Colors.pink, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

incorrectValueDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Invalid Value',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          content: const Text('Please put a value greater then 0.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
              )),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

sendDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Thanks for your Transaction",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

withDrawDialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Thanks for your Withdrawal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
