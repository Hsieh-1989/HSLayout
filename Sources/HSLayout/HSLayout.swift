#if os(OSX)
import AppKit
#else
import UIKit
#endif

/// A type that takes two views then generates autoLayout constraints.
public struct HSLayout {
    let constraints: (_ view: View, _ otherView: View) -> [NSLayoutConstraint]
    public init(constraints: @escaping (_ view: View, _ otherView: View) -> [NSLayoutConstraint]) {
        self.constraints = constraints
    }
}

extension HSLayout {
    /// specify the view you want to constraint to
    /// - Parameter otherView: new target view
    /// - Returns: Layout that swap the tartget view
    public func toView(_ otherView: View) -> HSLayout {
        .init { view, _ in constraints(view, otherView) }
    }
    
    /// switch the target view you want to constraint with the providing layout
    /// - Parameters:
    ///   - view: the target view you want to constraint to
    ///   - layout: layout used to constraint original view to the providing view
    /// - Returns: Layout that constraint to the tartget view
    public static func constraint(to view: View, layout: HSLayout) -> HSLayout {
        layout.toView(view)
    }
}

// MARK: - Composable Layout helpers
extension HSLayout {
    /// the layout doing nothing
    public static let empty: HSLayout = HSLayout { _, _ in [] }
    
    /// concatenate multiple layouts
    /// - Parameter layouts: Layouts
    /// - Returns: composed layout
    public static func concat(_ layouts: HSLayout...) -> HSLayout {
        .concat(layouts)
    }
    
    /// concatenate multiple layouts
    /// - Parameter layouts: Layouts
    /// - Returns: composed layout
    public static func concat(_ layouts: [HSLayout]) -> HSLayout {
        .init { view1, view2 in
            layouts.flatMap { $0.constraints(view1, view2) }
        }
    }
    
    /// build layout with constant constraints
    /// - Parameter constraints: constant constraints
    /// - Returns: layout with constant constraints
    public static func always(_ constraints: [NSLayoutConstraint]) -> HSLayout {
        .init { _, _ in constraints }
    }
}
