//
//  ShimmerCellView.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

class ShimmerCellView: UITableViewCell {
    @IBOutlet var shimmerViews: [ShimmerView]!

    func startShimmer() {
        shimmerViews.forEach { shimmerView in
            shimmerView.start()
        }
    }

    func stopShimmer() {
        removeFromSuperview()
    }
}
