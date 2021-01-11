//
//  ShimmerView.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/11/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

public class ShimmerView: UIView {
    public func start(duration: TimeInterval = 1.0) {
        let gradientColorOne = UIColor.ShimmerViewEdge.cgColor
        let gradientColorTwo = UIColor.ShimmerViewCenter.cgColor

        DispatchQueue.main.async { [unowned self] in
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
            gradientLayer.locations = [0.0, 0.25, 0.75]
            self.layer.addSublayer(gradientLayer)

            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [-1, -0.75, -0.25]
            animation.toValue = [1, 1.25, 1.75]
            animation.repeatCount = .infinity
            animation.duration = duration

            gradientLayer.add(animation, forKey: animation.keyPath)
        }
    }
}
