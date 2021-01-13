//
//  Book.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let thumbnail: UIImage?
    let author: Author
    var description: String

    init(title: String, thumbnail: UIImage?, author: Author, description: String) {
        self.title = title
        self.author = author
        self.thumbnail = thumbnail
        self.description = description
    }
}
