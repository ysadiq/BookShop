//
//  ViewController.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }

    func registerCells() {
        let nibShimmerCell = UINib(nibName: .shimmerCellNib, bundle: .main)
        let nibCell = UINib(nibName: .dataCellNib, bundle: .main)

        tableView.register(nibCell, forCellReuseIdentifier: .dataCellReuseId)
        tableView.register(nibShimmerCell, forCellReuseIdentifier: .shimmerCellReuseId)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shimmerCell = tableView.dequeueReusableCell(withIdentifier: .shimmerCellReuseId,
                                                        for: indexPath) as? ShimmerCellView
        if 1 == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .dataCellReuseId,
                                                           for: indexPath) as? DataCellView else {
                    return DataCellView()
            }

            cell.setup(with: Book(title: "", author: Author(name: "")))

            return cell
        } else {
            shimmerCell?.startShimmer()
            return shimmerCell ?? ShimmerCellView()
        }

        return UITableViewCell()
    }


}
