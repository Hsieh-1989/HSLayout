//: [Previous](@previous)

import UIKit
import HSLayout
import PlaygroundSupport

let view1 = UIView(frame: .init(origin: .zero, size: .init(width: 400, height: 400)))
let view2 = UIView.color(.black)
let view3 = UIView.color(.blue)
let view4 = UIView.color(.yellow)
let view5 = UIView.color(.red)

view1.addSubViews([
    .view(view2, layout: .concat(
        .center,
        .size(.init(width: 200, height: 200)),
        .addSubView(view3, layout: .fit(horizontal: 50, vertical: 50))
    )),
    .view(view4,layout: .concat(
        .constraint(\.bottomAnchor),
        .constraint(\.trailingAnchor),
        .size(.init(width: 100, height: 100))
    )),
    .view(view5, layout: .concat(
        .constraint(\.topAnchor),
        .constraint(\.leadingAnchor),
        .size(.init(width: 100, height: 100))
    ))
])

PlaygroundPage.current.liveView = view1

//: [Next](@next)
