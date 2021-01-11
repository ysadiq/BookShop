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
    private let refreshControl = UIRefreshControl()
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        initViewModel()
        addRefreshController()
    }

    func registerCells() {
        let nibShimmerCell = UINib(nibName: .shimmerCellNib, bundle: .main)
        let nibCell = UINib(nibName: .dataCellNib, bundle: .main)

        tableView.register(nibCell, forCellReuseIdentifier: .dataCellReuseId)
        tableView.register(nibShimmerCell, forCellReuseIdentifier: .shimmerCellReuseId)
    }

    func addRefreshController() {
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

    }

    @objc func refreshData(_ sender: Any) {
        viewModel.allBooks = []
        viewModel.fetchBooks()
    }

    func initViewModel() {
        viewModel.updateLoadingStatus = { [unowned self] in
            if self.viewModel.state == .populated {
                self.refreshControl.endRefreshing()
            }
            self.tableView.reloadData()
        }

        viewModel.fetchBooks()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allBooks.isEmpty ? .numberOfShimmeringCells : viewModel.allBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shimmerCell = tableView.dequeueReusableCell(withIdentifier: .shimmerCellReuseId,
                                                        for: indexPath) as? ShimmerCellView
        if viewModel.allBooks.isEmpty {
            shimmerCell?.startShimmer()
            return shimmerCell ?? ShimmerCellView()
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .dataCellReuseId,
                                                           for: indexPath) as? DataCellView else { return DataCellView() }

            cell.setup(with: viewModel.allBooks[indexPath.row])
            return cell
        }
    }


}
