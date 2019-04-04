package com.fleximex.bluetoothonoff;

import android.bluetooth.BluetoothAdapter;
import android.os.Build;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** BluetoothOnOffPlugin */
public class BluetoothOnOffPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "BluetoothOnOff");
    channel.setMethodCallHandler(new BluetoothOnOffPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    int intResult = -1;
    String callType = "on";
    if (call.method.equals("turnOnBluetooth")) {
      callType = "on";
      intResult = turnOnBluetooth();
    }
    else if (call.method.equals("turnOffBluetooth")) {
      callType = "off";
      intResult = turnOffBluetooth();
    }
    switch(intResult)
    {

      case 0:
        result.error("FAILED", "Could not turn " + callType + " Bluetooth.", intResult);
        break;
      case 1:
        result.success(intResult);
        break;
      case 2:
        result.error("ALERT", "Bluetooth was already " + callType + ".", intResult);
        break;
      case 3:
        result.error("ERROR", "Android version lower than 4.4 (KitKat) is unsupported.", intResult);
        break;
      default:
      case -1:
        result.notImplemented();
        break;
    }
  }

  private int turnOnBluetooth() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT)
    {
      BluetoothAdapter mBtAdapter = BluetoothAdapter.getDefaultAdapter();
      if (!mBtAdapter.isEnabled()) {
        if(mBtAdapter.enable())
        {
          return 1;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 3;
    }
    return 0;
  }

  private int turnOffBluetooth() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT)
    {
      BluetoothAdapter mBtAdapter = BluetoothAdapter.getDefaultAdapter();
      if (mBtAdapter.isEnabled()) {
        if(mBtAdapter.disable())
        {
          return 1;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 3;
    }
    return 0;
  }
}
