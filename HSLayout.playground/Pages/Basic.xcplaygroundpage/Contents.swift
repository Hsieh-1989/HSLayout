//: [Previous](@previous)

import UIKit
import HSLayout
import PlaygroundSupport

let view1 = UIView(frame: .init(origin: .zero, size: .init(width: 400, height: 400)))
let view2 = UIView.color(.black)
let view3 = UIView.color(.blue)
let view4 = UIView.color(.yellow)
let view5 = UIView.color(.red)

view1.addSubView(view2, layout: .fit(horizontal: 20, vertical: 20))

view2.addSubView(view3, layout: .concat(
    .center,
    .size(.init(width: 200, height: 200))
))

view3.addSubView(view4, layout: .concat(
    .constraint(\.topAnchor, constant: 20),
    .constraint(\.leadingAnchor),
    .constraint(\.widthAnchor, multiplier: 0.8),
    .constant(\.heightAnchor, value: 70)
))

view3.addSubView(view5, layout: .concat(
    .constraint(\.topAnchor, to: \.bottomAnchor, constant: 20).toView(view4),
    .equalSize.toView(view4),
    .constraint(\.trailingAnchor)
))

PlaygroundPage.current.liveView = view1

//: [Next](@next)
