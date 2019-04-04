![Logo](https://github.com/Fleximex/BluetoothOnOff/blob/master/logo.png?raw=true)

# BluetoothOnOff 
A simple Flutter plugin for turning on and off Bluetooth on Android devices.  
  
## Getting Started  
### Basic
#### Import the library
```dart
import 'package:bluetoothonoff/bluetoothonoff.dart';
```
#### Turn on Bluetooth
```dart
BluetoothOnOff.turnOnBluetooth;
```
#### Turn off Bluetooth
```dart
BluetoothOnOff.turnOffBluetooth;
```
<br>

### More
Since turnOnBluetooth and turnOffBluetooth both return a `Future<bool>` you can await them. So as shown in the[example](https://github.com/Fleximex/BluetoothOnOff/blob/master/example/lib/main.dart) you can use the bool for checking if the invocation was successful.

#### Await (inside an async function)
```dart
bool success = false;
success = await BluetoothOnOff.turnOnBluetooth;
```
## Troubleshooting
#### The plugin doesn't work on my AVD (Android Virtual Device)
Because Bluetooth emulation is not supported by AVD you need to run your Flutter project on a physical device.
#### The plugin does not work on iOS
Currently only Android is supported.
#### Bluetooth does not turn on or off
Check the console. If the plugin fails to turn on or off Bluetooth it will print a string containing any of the following self explanatory PlatformExceptions:
 - Bluetooth was already on/off.
 - Android version lower than 4.4 (KitKat) is unsupported.
 - Could not turn on/off " Bluetooth. *(something went wrong on the Android OS side)*