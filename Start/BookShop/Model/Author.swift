//
//  Author.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

class Author {
    let name: String
    var books: [Book] = []

    init(name: String) {
        self.name = name
    }
}
