//
//  ShimmerView.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/11/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

public class ShimmerView: UIView {
    public func startAnimation(duration: TimeInterval = 1.0) {
        let gradientColorOne = UIColor.ShimmerViewEdge.cgColor
        let gradientColorTwo = UIColor.ShimmerViewCenter.cgColor

        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.layer.masksToBounds = true
            let gradientLayer = CAGradientLayer()
            var frame = self.bounds
            frame.size.width *= 2
            gradientLayer.frame = frame
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
