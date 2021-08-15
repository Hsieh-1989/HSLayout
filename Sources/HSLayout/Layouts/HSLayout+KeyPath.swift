#if os(OSX)
import AppKit
#else
import UIKit
#endif

// MARK: - Composable Layout unit powered by KeyPath

extension HSLayout {
    /// build a constraint according to their `KeyPath` to `NSLayoutAnchor`
    /// - Parameters:
    ///   - keyPath: the view's keyPath to anchor
    ///   - otherKeyPath: other view's keyPath to anchor
    ///   - relation: the relation between this two views
    ///   - constant: the constant offset for the constraint.
    ///   - priority: the priority of the constraint.
    /// - Returns: the layout that generates a single constraint
    public static func constraint<Axis, Anchor>(
        _ keyPath: KeyPath<View, Anchor>,
        to otherKeyPath: KeyPath<View, Anchor>,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: LayoutPriority = .required
    ) -> HSLayout where Anchor: NSLayoutAnchor<Axis> {
        
        .init { view, otherView in
            
            let anchor = view[keyPath: keyPath]
            let otherAnchor = otherView[keyPath: otherKeyPath]
            
            let constraint: NSLayoutConstraint
            switch relation {
            case .equal:
                constraint = anchor.constraint(
                    equalTo: otherAnchor,
                    constant: constant
                )
            case .greaterThanOrEqual:
                constraint = anchor.constraint(
                    greaterThanOrEqualTo: otherAnchor,
                    constant: constant
                )
            case .lessThanOrEqual:
                constraint = anchor.constraint(
                    lessThanOrEqualTo: otherAnchor,
                    constant: constant
                )
            @unknown default:
                assertionFailure("unknown relation")
                constraint = anchor.constraint(
                    equalTo: otherAnchor,
                    constant: constant
                )
            }
            
            constraint.priority = priority
            return [constraint]
        }
    }
    
    /// build a constraint according to the `KeyPath`  to `NSLayoutAnchor`
    /// - Parameters:
    ///   - keyPath: the view's keyPath to anchor
    ///   - relation: the relation between this two views
    ///   - constant: the constant offset for the constraint.
    ///   - priority: the priority of the constraint.
    /// - Returns: the layout that generates a single constraint
    public static func constraint<Axis, Anchor>(
        _ keyPath: KeyPath<View, Anchor>,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: LayoutPriority = .required
    ) -> HSLayout where Anchor: NSLayoutAnchor<Axis> {
        
        .constraint(
            keyPath,
            to: keyPath,
            relation: relation,
            constant: constant,
            priority: priority
        )
    }
    
    /// build a constraint according to their `KeyPath` to `NSLayoutDimension`
    /// - Parameters:
    ///   - keyPath: the view's keyPath to anchor
    ///   - otherKeyPath: the relation between this two views
    ///   - relation: the relation between this two views
    ///   - constant: the constant offset for the constraint.
    ///   - multiplier: the multiplier constant for the constraint.
    ///   - priority: the priority of the constraint.
    /// - Returns: the layout that generates a single constraint
    public static func constraint<Anchor>(
        _ keyPath: KeyPath<View, Anchor>,
        to otherKeyPath: KeyPath<View, Anchor>,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: LayoutPriority = .required
    ) -> HSLayout where Anchor: NSLayoutDimension {
        
        .init { view, otherView in
            
            let anchor = view[keyPath: keyPath]
            let otherAnchor = otherView[keyPath: otherKeyPath]
            
            let constraint: NSLayoutConstraint
            switch relation {
            case .equal:
                constraint = anchor.constraint(
                    equalTo: otherAnchor,
                    multiplier: multiplier,
                    constant: constant
                )
            case .greaterThanOrEqual:
                constraint = anchor.constraint(
                    greaterThanOrEqualTo: otherAnchor,
                    multiplier: multiplier,
                    constant: constant
                )
            case .lessThanOrEqual:
                constraint = anchor.constraint(
                    lessThanOrEqualTo: otherAnchor,
                    multiplier: multiplier,
                    constant: constant
                )

            @unknown default:
                assertionFailure("unknown relation")
                constraint = anchor.constraint(
                    equalTo: otherAnchor,
                    multiplier: multiplier,
                    constant: constant
                )
            }
            
            constraint.priority = priority
            return [constraint]
        }
    }
    
    /// build a constraint according to the `KeyPath` to `NSLayoutDimension`
    /// - Parameters:
    ///   - keyPath: the view's keyPath to anchor
    ///   - relation: the relation between this two views
    ///   - constant: the constant offset for the constraint.
    ///   - multiplier: the multiplier constant for the constraint.
    ///   - priority: the priority of the constraint.
    /// - Returns: the layout that generates a single constraint
    public static func constraint<Anchor>(
        _ keyPath: KeyPath<View, Anchor>,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        priority: LayoutPriority = .required
    ) -> HSLayout where Anchor: NSLayoutDimension {
        
        .constraint(
            keyPath,
            to: keyPath,
            relation: relation,
            constant: constant,
            multiplier: multiplier,
            priority: priority
        )
    }
    
    /// build  a constant size constraint according to the `KeyPath` to `NSLayoutDimension`
    /// - Parameters:
    ///   - keyPath: the view's keyPath to anchor
    ///   - relation: the relation of the view and the constant value
    ///   - value: a constant representing the size of the attribute associated with this dimension anchor.
    ///   - priority: the priority of the constraint.
    /// - Returns: the layout that generates a single constraint
    public static func constant<Anchor>(
        _ keyPath: KeyPath<View, Anchor>,
        relation: NSLayoutConstraint.Relation = .equal,
        value: CGFloat,
        priority: LayoutPriority = .required
    ) -> HSLayout where Anchor: NSLayoutDimension {
        
        .init { view, _ in
            
            let anchor = view[keyPath: keyPath]
        
            let constraint: NSLayoutConstraint
            switch relation {
            case .equal:
                constraint = anchor.constraint(equalToConstant: value)
            case .greaterThanOrEqual:
                constraint = anchor.constraint(greaterThanOrEqualToConstant: value)
            case .lessThanOrEqual:
                constraint = anchor.constraint(lessThanOrEqualToConstant: value)
            @unknown default:
                assertionFailure("unknown relation")
                constraint = anchor.constraint(equalToConstant: value)
            }
            
            constraint.priority = priority
            return [constraint]
        }
    }
}
