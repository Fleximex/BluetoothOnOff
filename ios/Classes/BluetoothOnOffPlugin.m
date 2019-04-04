#import "BluetoothOnOffPlugin.h"

@implementation BluetoothOnOffPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"BluetoothOnOff"
            binaryMessenger:[registrar messenger]];
  BluetoothOnOffPlugin* instance = [[BluetoothOnOffPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"turnBluetoothOn" isEqualToString:call.method]) {
    if (central.state == CBCentralManagerStatePoweredOff) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please turn on Bluetooth in Settings" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    result([@"iOS " stringByAppendingString:"Bluetooth window opened");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
