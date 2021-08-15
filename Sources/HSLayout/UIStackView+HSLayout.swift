#if os(iOS)
import UIKit

extension View {
    /// - add stack view then add arranged subviews to the stack view.
    /// - constains stack view according to the `layout`
    /// - constrain child views according to their own `layout`
    /// - Parameters:
    ///   - axis: the axis along which the arranged views are laid out.
    ///   - distribution: the distribution of the arranged views along the stack view’s axis.
    ///   - alignment: the alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///   - spacing: the distance in points between the adjacent edges of the stack view’s arranged views.
    ///   - views: multiple boxes that represent the child views with their layout
    ///   - layout: the layout used to constraint the stack view to the target view
    /// - Returns: constraints that generated according to the LayoutBoxs and the constraints generated according to the `layout` with self and stack view
    @discardableResult
    public func addStack(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0,
        views: [HSLayout.Box],
        layout: HSLayout = .fit()
    ) -> [NSLayoutConstraint] {
        
        addStack(
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing,
            active: true,
            views: views,
            layout: layout
        )
    }
}

extension UIStackView {
    /// add arranged subviews and constrain them according to their `layout`
    /// - Parameter views: multiple boxes that represent the child views with their layout
    /// - Returns: constraints that generated according to the LayoutBoxs
    @discardableResult
    public func addArrangedSubview(_ views: [HSLayout.Box]) -> [NSLayoutConstraint] {
        addArrangedSubview(active: true, views)
    }
}

// MARK: - internal helper
extension View {
    func addStack(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 0,
        active: Bool,
        views: [HSLayout.Box],
        layout: HSLayout = .fit()
    ) -> [NSLayoutConstraint] {
        
        let stack = UIStackView(
            axis: axis,
            distribution: distribution,
            alignment: alignment,
            spacing: spacing
        )
        
        return addSubView(stack, active: active, layout: layout)
            + stack.addArrangedSubview(active: active, views)
    }
}

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = 0
    ) {
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func addArrangedSubview(active: Bool, _ views: [HSLayout.Box]) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for sub in views {
            addArrangedSubview(sub.view)
            constraints.append(contentsOf: sub.constraints(to: self))
        }
        if active {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
}

#endif
