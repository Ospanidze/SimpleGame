//
//  UIStackView + ext.swift
//  SimpleGame
//
//  Created by Айдар Оспанов on 28.05.2023.
//

import UIKit

extension UIStackView {
    
    func styleStackView(spacing: CGFloat, aligment: UIStackView.Alignment, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, userInteraction: Bool) -> Self {
        self.spacing = spacing
        self.alignment = aligment
        self.axis = axis
        self.distribution = distribution
        self.isUserInteractionEnabled = userInteraction
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setlayoutMargins(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) -> Self {
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}

//extension UIStackView {
//    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 10, distribution: UIStackView.Distribution = .fillEqually) {
//        self.init(arrangedSubviews: arrangedSubviews)
//        self.axis = axis
//        self.spacing = spacing
//        self.distribution = distribution
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//}
