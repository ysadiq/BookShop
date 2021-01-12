//
//  DataCellView.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

class DataCellView: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var desc: UILabel!

    func setup(with book: Book) {
        title.text = book.title
        desc.text = book.description
        coverImageView.image = book.thumbnail
        authorName.text = book.author.name
    }
}
