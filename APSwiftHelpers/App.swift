import Foundation

/**
 Contains values about the currently running application. This struct should not
 need to be initialized directly.
*/
public struct App {
    /// Specifies whether the app is running within the iPhone
    /// simulator or not.
    public static var inSimulator: Bool {
        return (TARGET_IPHONE_SIMULATOR != 0)
    }

    /**
     Specifies whether the app is running in a Debug configuration.
     - Returns: Bool whether the app is running in simulator
    */
    public static var isDebug: Bool {
        return _isDebugAssertConfiguration()
    }

    /// Get the name of the currently running application
    public static var name: String? {
        return getFromInfo("CFBundleDisplayName")
    }

    /// Get the version of the currently running application
    public static var version: String? {
        return getFromInfo("CFBundleShortVersionString")
    }

    /**
     Get a formatted name and version for the running application
     in this format: `MyApp (1.1)`.
    */
    public static var formattedNameAndVersion: String? {
        if let name = App.name, let ver = App.version {
            return "\(name) (\(ver))"
        } else {
            return nil
        }
    }

    /// Internal protocol used for stubbing out NSBundle behaviour
    internal static var plistProvider: PlistProvider = NSBundle.mainBundle()

    /**
     Get info from the bundle's plist for a specific key
     - Parameter key: The key to look up
     - Returns: A value from the bundle's plist
    */
    private static func getFromInfo(key: String) -> String? {
        return plistProvider.objectForInfoDictionaryKey(key) as? String
    }
}

protocol PlistProvider {
    func objectForInfoDictionaryKey(key: String) -> AnyObject?
}

extension NSBundle: PlistProvider {}
