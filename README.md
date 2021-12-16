# HSLayout

A library for building autolayout constraints in a consistent and understandable way, with composition in mind.

## Requirements

- iOS 11.0+ / Mac OS X 11.0+ / tvOS 11.0+
- Xcode 12.0+
- Swift 5.3+

## Installation

You can add HSLayout to an Xcode project by adding it as a package dependency.

> https://github.com/Hsieh-1989/HSLayout.git

If you want to use HSLayout in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding a `dependencies` clause to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Hsieh-1989/HSLayout.git", from: "0.1.2")
]
```

## Examples

### Edges

Pinning view's edges to its superview with `NSLayoutConstraint`:

```swift
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
])
```

with `HSLayout`:

```swift
view.constraints(to: superview, layout: .fit())
```

### Center

Constraining the center of a view to its superview with `NSLayoutConstraint`:

```swift
NSLayoutConstraint.activate([
    view.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0)
    view.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0)
])
```

with `HSLayout`:

```swift
view.constraints(to: superview, layout: .center)
```

### Alignment

Aligning the view to its superview with `NSLayoutConstraint`:

```swift
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20),
])
```

with `HSLayout`:

```swift
view.constraints(to: superview, layout: .alignment(.topLeading, offset: .init(x: 20, y: 20)))
```

### Add SubView With Layouts

Adding subview and constraining to its superview with `NSLayoutConstraint`:

```swift
view.translatesAutoresizingMaskIntoConstraints = false
superview.addSubview(view)
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
])
```

with `HSLayout`:

```swift
superview.addSubview(view, layout: .fit())
```

### Customized Reusable & Composable Layouts!

It's easy to make reusable layout units then make a complex layout with composition:

```swift
// making the view center to its superview and never beyond parent's edge with preferred size.
superview.addSubview(view, layout: .insideCenter(preferredSize: CGSize(width: 500, height: 500)))

extension HSLayout {
    static func insideCenter(preferredSize: CGSize, margin: UIEdgeInsets = .zero) -> HSLayout {
        .concat(
            .center,
            .inside(margin: margin),
            .preferredSize(preferredSize)
        )
    }
    
    static func inside(margin: UIEdgeInsets = .zero) -> HSLayout {
        .concat(
            .constraint(\.topAnchor, relation: .greaterThanOrEqual, constant: margin.top),
            .constraint(\.leadingAnchor, relation: .greaterThanOrEqual, constant: margin.left),
            .constraint(\.trailingAnchor, relation: .lessThanOrEqual, constant: -margin.right),
            .constraint(\.bottomAnchor, relation: .lessThanOrEqual, constant: -margin.bottom)
        )
    }
    
    static func preferredSize(_ size: CGSize) -> HSLayout {
        .concat(
            .constant(\.widthAnchor, value: size.width, priority: .fittingSizeLevel),
            .constant(\.heightAnchor, value: size.height, priority: .fittingSizeLevel)
        )
    }
}
```
