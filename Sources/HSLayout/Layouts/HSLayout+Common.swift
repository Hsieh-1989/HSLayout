#if os(OSX)
import AppKit
#else
import UIKit
#endif

extension HSLayout {
    /// centers two views
    public static let center: HSLayout = .concat(
        .constraint(\.centerXAnchor),
        .constraint(\.centerYAnchor)
    )
    
    /// the layout makes two view's sizes equal
    public static let equalSize: HSLayout = .concat(
        .constraint(\.widthAnchor),
        .constraint(\.heightAnchor)
    )
    
    /// makes the view's ratio fixed
    /// - Parameter ratio: the ration of this view
    /// - Returns: the layout makes the view's ratio fixed
    public static func ratio(_ ratio: CGSize) -> HSLayout {
        .init { view, _ in
            [view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio.width/ratio.height)]
        }
    }
    
    /// makes the view's size fixed
    /// - Parameter size: the size of this view
    /// - Returns: the layout makes the view's size fixed
    public static func size(_ size: CGSize) -> HSLayout {
        .concat(
            .constant(\.widthAnchor, value: size.width),
            .constant(\.heightAnchor, value: size.height)
        )
    }
    
    /// makes the view fit to the target view
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - horizontal: horizontal padding
    ///   - vertical: vertical padding
    /// - Returns: the layout makes the view fit to the target view
    public static func fit(
        toSafeArea: Bool = false,
        horizontal: CGFloat,
        vertical: CGFloat
    ) -> HSLayout {
        
        .fit(
            toSafeArea: toSafeArea,
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }
    
    /// makes the view fit to the target view
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - top: top padding
    ///   - leading: leading padding
    ///   - bottom: bottom padding
    ///   - trailing: trailing padding
    /// - Returns: the layout makes the view fit to the target view
    public static func fit(
        toSafeArea: Bool = false,
        top: CGFloat = 0,
        leading: CGFloat = 0,
        bottom: CGFloat = 0,
        trailing: CGFloat = 0
    ) -> HSLayout {
        
        .concat(
            .fitWidth(
                toSafeArea: toSafeArea,
                leading: leading,
                trailing: trailing
            ),
            .fitHeight(
                toSafeArea: toSafeArea,
                top: top,
                bottom: bottom
            )
        )
    }
    
    /// makes the view's width fit to the target view's width
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - padding: the padding on both leading and trailing
    /// - Returns: the layout makes the view's width fit to the target view's width
    public static func fitWidth(
        toSafeArea: Bool = false,
        padding: CGFloat
    ) -> HSLayout {
        
        .fitWidth(
            toSafeArea: toSafeArea,
            leading: padding,
            trailing: padding
        )
    }
    
    /// makes the view's height fit to the target view's height
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - padding: the padding on both top and bottom
    /// - Returns: the layout makes the view's height fit to the target view's height
    public static func fitHeight(
        toSafeArea: Bool = false,
        padding: CGFloat
    ) -> HSLayout {
        
        .fitHeight(
            toSafeArea: toSafeArea,
            top: padding,
            bottom: padding
        )
    }
    
    /// makes the view's width fit to the target view's width
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - leading: leading padding
    ///   - trailing: trailing padding
    /// - Returns: the layout makes the view's width fit to the target view's width
    public static func fitWidth(
        toSafeArea: Bool = false,
        leading: CGFloat = 0,
        trailing: CGFloat = 0
    ) -> HSLayout {
        
        let leadingAnchor = toSafeArea
            ? \View.safeAreaLayoutGuide.leadingAnchor
            : \View.leadingAnchor

        let trailingAnchor = toSafeArea
            ? \View.safeAreaLayoutGuide.trailingAnchor
            : \View.trailingAnchor

        return .concat(
            .constraint(leadingAnchor, constant: leading),
            .constraint(trailingAnchor, constant: -trailing)
        )
    }
    
    /// makes the view's height fit to the target view's height
    /// - Parameters:
    ///   - toSafeArea: should consider the safe area
    ///   - top: top padding
    ///   - bottom: bottom padding
    /// - Returns: the layout makes the view's height fit to the target view's height
    public static func fitHeight(
        toSafeArea: Bool = false,
        top: CGFloat = 0,
        bottom: CGFloat = 0
    ) -> HSLayout {
        
        let topAnchor = toSafeArea
            ? \View.safeAreaLayoutGuide.topAnchor
            : \View.topAnchor
        
        let bottomAnchor = toSafeArea
            ? \View.safeAreaLayoutGuide.bottomAnchor
            : \View.bottomAnchor
        
        return .concat(
            .constraint(topAnchor, constant: top),
            .constraint(bottomAnchor, constant: -bottom)
        )
    }
}
