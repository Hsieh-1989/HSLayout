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
    .package(url: "https://github.com/Hsieh-1989/HSLayout.git", from: "0.1.0")
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
