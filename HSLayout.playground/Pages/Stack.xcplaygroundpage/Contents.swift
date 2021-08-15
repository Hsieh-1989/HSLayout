//: [Previous](@previous)

import UIKit
import HSLayout
import PlaygroundSupport

let view1 = UIView(frame: .init(origin: .zero, size: .init(width: 400, height: 400)))
let view2 = UIView.color(.black)
let view3 = UIView.color(.blue)
let view4 = UIView.color(.yellow)
let view5 = UIView.color(.red)

view1.addStack(
    axis: .vertical,
    distribution: .fillEqually,
    spacing: 10,
    views: [
        .view(view2),
        .stack(
            axis: .horizontal,
            distribution: .fillEqually,
            spacing: 10,
            views: [
                .view(view3),
                .view(view4),
                .view(view5)
            ],
            layout: .empty
        )
    ],
    layout: .fit(horizontal: 10, vertical: 10)
)

PlaygroundPage.current.liveView = view1

//: [Next](@next)
