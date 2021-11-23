//: [Previous](@previous)

import UIKit
import HSLayout
import PlaygroundSupport

extension HSLayout {
    static let cubeSize: HSLayout = .size(.init(width: 120, height: 120))
}

let view = UIView(frame: .init(origin: .zero, size: .init(width: 400, height: 400)))
let cube1 = UIView.color(.orange)
let cube2 = UIView.color(.blue)
let cube3 = UIView.color(.black)
let cube4 = UIView.color(.red)
let cube5 = UIView.color(.cyan)

view.addSubViews([
    .view(cube1, layout: .concat(
        .cubeSize,
        .alignment(.topLeading, offset: .init(x: 20, y: 20))
    )),
    .view(cube2, layout: .concat(
        .cubeSize,
        .alignment(.topTrailing, offset: .init(x: -20, y: 20))
    )),
    .view(cube3, layout: .concat(
        .cubeSize,
        .alignment(.center)
    )),
    .view(cube4, layout: .concat(
        .cubeSize,
        .alignment(.bottomLeading, offset: .init(x: 20, y: -20))
    )),
    .view(cube5, layout: .concat(
        .cubeSize,
        .alignment(.bottomTrailing, offset: .init(x: -20, y: -20))
    ))
])

PlaygroundPage.current.liveView = view

//: [Next](@next)
