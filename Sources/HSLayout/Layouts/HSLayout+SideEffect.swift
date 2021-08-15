#if os(OSX)
import AppKit
#else
import UIKit
#endif

extension HSLayout {
    /// add child view and generate constrains according to the `layout`
    /// - Parameters:
    ///   - view: target view
    ///   - layout: the layout used to constraint these two views
    /// - Returns: the layout that generate constraints according to the `layout` with these two views
    public static func addSubView(_ view: View, layout: HSLayout) -> HSLayout {
        .init { parent, _ in
            parent.addSubView(view, active: false, layout: layout)
        }
    }
    
    /// add multiple child views and generate constrains according to their own layout
    /// - Parameter views: multiple boxes that represent the child views with their layout
    /// - Returns: the layout that add multiple child views and generate constrains according to their own layout
    public static func addSubViews(_ views: [Box]) -> HSLayout {
        .init { parent, _ in
            parent.addSubViews(active: false, views)
        }
    }
}

#if os(iOS)
// MARK: - StackView
extension HSLayout {
    /// add stack view and add child views to it, then generate constrains according to their own layout
    /// - Parameters:
    ///   - axis: the axis along which the arranged views are laid out.
    ///   - distribution: the distribution of the arranged views along the stack view’s axis.
    ///   - alignment: the alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - spacing: the distance in points between the adjacent edges of the stack view’s arranged views.
    ///   - views: multiple boxes that represent the child views with their layout
    ///   - layout: the layout used to constraint the stack view to the target view
    /// - Returns: the layout that add stack view and add child views to it, then generate constrains according to their own layout
    public static func addStack(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0,
        views: [Box],
        layout: HSLayout = .fit()
    ) -> HSLayout {
        
        .init { parent, _ in
            parent.addStack(
                axis: axis,
                distribution: distribution,
                alignment: alignment,
                spacing: spacing,
                active: false,
                views: views,
                layout: layout
            )
        }
    }
}
#endif
