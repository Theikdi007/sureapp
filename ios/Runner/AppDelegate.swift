import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "DeviceCaps") {
      DeviceCapsChannel.register(messenger: registrar.messenger())
    }
  }
}

/// Accessibility facts Flutter doesn't expose (Reduce Transparency), used to
/// pick the glass tier. See lib/core/platform/device_caps.dart.
final class DeviceCapsChannel: NSObject, FlutterStreamHandler {
  private static var instance: DeviceCapsChannel?
  private var sink: FlutterEventSink?

  static func register(messenger: FlutterBinaryMessenger) {
    let handler = DeviceCapsChannel()
    instance = handler
    FlutterMethodChannel(name: "sure_app/device_caps", binaryMessenger: messenger)
      .setMethodCallHandler { call, result in
        guard call.method == "read" else { return result(FlutterMethodNotImplemented) }
        result(["reduceTransparency": UIAccessibility.isReduceTransparencyEnabled])
      }
    FlutterEventChannel(name: "sure_app/reduce_transparency", binaryMessenger: messenger)
      .setStreamHandler(handler)
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    sink = events
    NotificationCenter.default.addObserver(
      self, selector: #selector(changed),
      name: UIAccessibility.reduceTransparencyStatusDidChangeNotification, object: nil)
    events(UIAccessibility.isReduceTransparencyEnabled)
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    NotificationCenter.default.removeObserver(self)
    sink = nil
    return nil
  }

  @objc private func changed() {
    sink?(UIAccessibility.isReduceTransparencyEnabled)
  }
}
