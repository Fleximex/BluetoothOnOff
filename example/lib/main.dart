import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bluetoothonoff/bluetoothonoff.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bluetooth On Off Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("Turn On Bluetooth"),
                  onPressed: () async {
                    bool success;
                    success = await BluetoothOnOff.turnOnBluetooth;
                  }),
              RaisedButton(
                  child: Text("Turn Off Bluetooth"),
                  onPressed: () async {
                    bool success;
                    success = await BluetoothOnOff.turnOffBluetooth;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
