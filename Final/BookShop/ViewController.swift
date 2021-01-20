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
    let refreshControl = UIRefreshControl()
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        addRefreshController()
        initViewModel()
    }
}
