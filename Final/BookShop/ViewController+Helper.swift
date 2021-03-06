//
//  ViewController+Helper.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/18/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

extension ViewController {
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

    func initViewModel() {
        viewModel.updateLoadingStatus = { [weak self] in
            guard let self = self else {
                return
            }
            
            if self.viewModel.state == .populated {
                self.refreshControl.endRefreshing()
            }
            self.tableView.reloadData()
        }

        viewModel.fetchBooks()
    }

    @objc func refreshData(_ sender: Any) {
        viewModel.allBooks = []
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
            return shimmerCell ?? UITableViewCell()
        } else {
            let dataCell = tableView.dequeueReusableCell(withIdentifier: .dataCellReuseId,
                                                     for: indexPath) as? DataCellView
            shimmerCell?.stopShimmer()
            dataCell?.setup(with: viewModel.allBooks[indexPath.row])
            return dataCell ?? UITableViewCell()
        }
    }
}
