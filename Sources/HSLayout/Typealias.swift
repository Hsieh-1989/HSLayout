#if os(OSX)
import AppKit

public typealias View = NSView
public typealias LayoutPriority = NSLayoutConstraint.Priority

#else
import UIKit

public typealias View = UIView
public typealias LayoutPriority = UILayoutPriority

#endif
