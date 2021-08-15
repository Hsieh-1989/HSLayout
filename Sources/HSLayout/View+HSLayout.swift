#if os(OSX)
import AppKit
#else
import UIKit
#endif

extension View {
    /// constraint self to the target view according to the `layout`
    /// - Parameters:
    ///   - view: target view
    ///   - layout: the layout used to constraint self to the target view
    /// - Returns: constraints that generated according to the `layout` with these two views
    @discardableResult
    public func constraints(to view: View, layout: HSLayout) -> [NSLayoutConstraint] {
        constraints(to: view, active: true, layout: layout)
    }
    
    /// add child view and constrain child view to self according to the `layout`
    /// - Parameters:
    ///   - view: child view
    ///   - layout: the layout used to constraint child view to self
    /// - Returns: constraints that generated according to the `layout` with these two views
    @discardableResult
    public func addSubView(_ view: View, layout: HSLayout) -> [NSLayoutConstraint] {
        addSubView(view, active: true, layout: layout)
    }
    
    /// add multiple child views and constrain child views according to their own layout
    /// - Parameter views: multiple boxes that represent the child views with their layout
    /// - Returns: constraints that generated according to the LayoutBoxs
    @discardableResult
    public func addSubViews(_ views: [HSLayout.Box]) -> [NSLayoutConstraint] {
        addSubViews(active: true, views)
    }
}

// MARK: internal helpers
extension View {
    func constraints(to view: View, active: Bool, layout: HSLayout) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = layout.constraints(self, view)
        if active {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
    
    func addSubView(_ view: View, active: Bool, layout: HSLayout) -> [NSLayoutConstraint] {
        addSubview(view)
        return view.constraints(to: self, active: active, layout: layout)
    }
    
    func addSubViews(active: Bool, _ subs: [HSLayout.Box]) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for sub in subs {
            addSubview(sub.view)
            constraints.append(contentsOf: sub.constraints(to: self))
        }
        if active {
            NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
}
