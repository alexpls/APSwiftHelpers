struct PlistStub: PlistProvider {
    func objectForInfoDictionaryKey(key: String) -> AnyObject? {
        switch key {
        case "CFBundleDisplayName":
            return "APSwiftHelpersTests"
        case "CFBundleShortVersionString":
            return "1.1"
        default:
            return nil
        }
    }
}
