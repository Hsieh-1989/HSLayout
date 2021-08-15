import UIKit

extension UIView {
    public static func color(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    public static func label(_ text: String, _ color: UIColor) -> UIView {
        let view = UILabel()
        view.backgroundColor = color
        view.text = text
        view.textAlignment = .center
        return view
    }
}
