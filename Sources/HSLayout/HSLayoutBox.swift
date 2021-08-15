#if os(OSX)
import AppKit
#else
import UIKit
#endif

extension HSLayout {
    /// A Box that bundles the view with its layout
    public struct Box {
        let view: View
        let layout: HSLayout
        
        public static func view(_ view: View, layout: HSLayout = .empty) -> Box {
            self.init(view: view, layout: layout)
        }
        
        func constraints(to otherView: View) -> [NSLayoutConstraint] {
            view.constraints(to: otherView, active: false, layout: layout)
        }
    }
}


#if os(iOS)
// MARK: - StackView
extension HSLayout.Box {
    /// buiild a box with stack view and it's arraged subviews
    /// - Parameters:
    ///   - axis: the axis along which the arranged views are laid out.
    ///   - distribution: the distribution of the arranged views along the stack view’s axis.
    ///   - alignment: the alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - spacing: the distance in points between the adjacent edges of the stack view’s arranged views.
    ///   - views: multiple boxes that represent the child views with their layout
    ///   - layout: the layout used to constraint the stack view to the target view
    /// - Returns: a box that contains a stack view and boxes that contains stack view's arranged subviews and their layout
    public static func stack(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0,
        views: [HSLayout.Box],
        layout: HSLayout = .empty
    ) -> HSLayout.Box {
        
        let stack = UIStackView(
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing
        )
        
        return HSLayout.Box(view: stack, layout: .init { v1, v2 in
            layout.constraints(v1, v2) + stack.addArrangedSubview(active: false, views)
        })
    }
}
#endif

