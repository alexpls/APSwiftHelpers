import Foundation

extension NSCoding {
    /**
     Archive this object to NSData using NSKeyedArchiver.

     - Returns: The archived `NSData`
    */
    public func archive() -> NSData {
        return NSKeyedArchiver.archivedDataWithRootObject(self)
    }

    /**
     Create a new instance of this object from the archived data passed in.

     - Parameter data:  The data to unarchive (can be created using the `archive()` function)
     - Returns: Unarchived NSCoding instance
    */
    public static func unarchive(data: NSData) -> Self? {
        return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Self
    }
}
