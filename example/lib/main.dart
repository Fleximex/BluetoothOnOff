// Written by Fleximex
// 2019

import 'package:flutter/material.dart';
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

  bool turningOnBluetooth = false;
  bool pressed = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bluetooth On Off Example'),
        ),
        body: Builder(
            // Create an inner BuildContext so that the onPressed methods
            // can refer to the Scaffold with Scaffold.of().
            builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 100,
                    child: turningOnBluetooth
                        ? CircularProgressIndicator()
                        : pressed
                            ? success
                                ? Icon(Icons.check,
                                    color: Color(0xff8bc34a), size: 56)
                                : Icon(Icons.clear,
                                    color: Color(0xfff44336), size: 56)
                            : Container()),
                RaisedButton(
                    child: Text("Turn On Bluetooth"),
                    onPressed: () async {
                      setState(() {
                        turningOnBluetooth = true;
                        pressed = true;
                      });
                      success = await BluetoothOnOff.turnOnBluetooth;
                      await Future.delayed(Duration(milliseconds: 1000));
                      setState(() {
                        turningOnBluetooth = false;
                      });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 3000),
                          content: success
                              ? Text("Successfully turned on Bluetooth!")
                              : Text("Failed to turn on Bluetooth!"),
                        ),
                      );
                      await Future.delayed(Duration(milliseconds: 3500));
                      setState(() {
                        pressed = false;
                        success = false;
                      });
                    }),
                RaisedButton(
                    child: Text("Turn Off Bluetooth"),
                    onPressed: () async {
                      setState(() {
                        turningOnBluetooth = true;
                        pressed = true;
                      });
                      success = await BluetoothOnOff.turnOffBluetooth;
                      await Future.delayed(Duration(milliseconds: 1000));
                      setState(() {
                        turningOnBluetooth = false;
                      });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 3000),
                          content: success
                              ? Text("Successfully turned off Bluetooth!")
                              : Text("Failed to turn off Bluetooth!"),
                        ),
                      );
                      await Future.delayed(Duration(milliseconds: 3500));
                      setState(() {
                        pressed = false;
                        success = false;
                      });
                    })
              ],
            ),
          );
        }),
      ),
    );
  }
}
