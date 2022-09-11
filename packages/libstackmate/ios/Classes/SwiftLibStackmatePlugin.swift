import Flutter
import UIKit

public class SwiftLibStackmatePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "libstackmate", binaryMessenger: registrar.messenger())
    let instance = SwiftLibStackmatePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }


  public func dummyMethodToEnforceBundling() {

    generate_master("12","","")
    import_master("","","");
    // derive_hardened("","","");
    compile("","");
    sync_balance("","");
    get_address("","","");
    sync_history("","");
    estimate_network_fee("","","");
    fee_absolute_to_rate("","");
    fee_rate_to_absolute("","");
    build_tx("","","","","");
    sign_tx("","","");
    broadcast_tx("","","");
    get_height("","");
    get_weight("","");
    // days_to_blocks("");
    cstring_free("");
  }

}
