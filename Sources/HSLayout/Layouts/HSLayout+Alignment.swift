#if os(OSX)
import AppKit
#else
import UIKit
#endif

/// An alignment in both axes. inspired by SwiftUI.
public struct Alignment {
    /// An alignment position along the horizontal axis.
    fileprivate enum Horizontal {
        case leading
        case center
        case trailing
    }
    
    /// An alignment position along the vertical axis.
    fileprivate enum Vertical {
        case top
        case center
        case bottom
    }
    
    fileprivate let horizontal: Horizontal?
    fileprivate let vertical: Vertical?
}

extension Alignment {
    
    /// A guide marking the bottom edge of the view.
    public static let bottom = Alignment(horizontal: nil, vertical: .bottom)
    
    /// A guide marking the bottom and leading edges of the view.
    public static let bottomLeading = Alignment(horizontal: .leading, vertical: .bottom)
    
    /// A guide marking the bottom and trailing edges of the view.
    public static let bottomTrailing = Alignment(horizontal: .trailing, vertical: .bottom)
    
    /// A guide marking the center of the view.
    public static let center = Alignment(horizontal: .center, vertical: .center)
    
    /// A guide marking the leading edge of the view.
    public static let leading = Alignment(horizontal: .leading, vertical: nil)
    
    /// A guide marking the top edge of the view.
    public static let top = Alignment(horizontal: nil, vertical: .top)
    
    /// A guide marking the top and leading edges of the view.
    public static let topLeading = Alignment(horizontal: .leading, vertical: .top)
    
    /// A guide marking the top and trailing edges of the view.
    public static let topTrailing = Alignment(horizontal: .trailing, vertical: .top)
    
    /// A guide marking the trailing edge of the view.
    public static let trailing = Alignment(horizontal: .trailing, vertical: nil)
}


extension HSLayout {
    
    /// align the view to the target view
    /// - Parameters:
    ///   - alignment: the guide for aligning the view to the target view
    ///   - offset: the distance to the target view
    /// - Returns: the layout makes the view align to the target view
    public static func alignment(_ alignment: Alignment, offset: CGPoint = .zero) -> HSLayout {
        return .concat([
            alignment.horizontal.map { horizontalAlignment($0, offset: offset.x) } ?? .empty,
            alignment.vertical.map { verticalAlignment($0, offset: offset.y) } ?? .empty
        ])
    }
    
    private static func horizontalAlignment(_ alignment: Alignment.Horizontal, offset: CGFloat) -> HSLayout {
        switch alignment {
        case .leading:
            return .constraint(\.leadingAnchor, constant: offset)
        case .center:
            return .constraint(\.centerXAnchor, constant: offset)
        case .trailing:
            return .constraint(\.trailingAnchor, constant: offset)
        }
    }
    
    private static func verticalAlignment(_ alignment: Alignment.Vertical, offset: CGFloat) -> HSLayout {
        switch alignment {
        case .top:
            return .constraint(\.topAnchor, constant: offset)
        case .center:
            return .constraint(\.centerYAnchor, constant: offset)
        case .bottom:
            return .constraint(\.bottomAnchor, constant: offset)
        }
    }
}
