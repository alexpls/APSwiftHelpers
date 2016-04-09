import Foundation
import QuartzCore

/**
 Wrap the given block in a CATransaction with animations disabled (or
 enabled if optional arg passed in).

 - Parameter disabled:  Whether to disable CAAnimations within the given block or not
 - Parameter closure:   The block to execute
*/
public func withCAAnimationsDisabled(disabled: Bool = true, closure: () -> Void) {
    CATransaction.begin()
    let cfBool = disabled ? kCFBooleanTrue : kCFBooleanFalse
    CATransaction.setValue(cfBool, forKey: kCATransactionDisableActions)
    closure()
    CATransaction.commit()
}
