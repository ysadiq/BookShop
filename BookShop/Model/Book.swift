//
//  Book.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

class Book {
    let title: String
    unowned let author: Author
    weak var editor: Editor?
    lazy var weakDescription: () -> String = { [weak self, title] in
        print(title)
        guard let self = self else {
            return "Error: Book is deinitialized"
        }
        return "\(self.title) by \(self.author.name)"
    }

    lazy var description: () -> String = { [weak self] in
        return "\(self?.title) by \(self?.author.name)"
    }

    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }

    deinit {
        print("Goodbye book \(title)!")
    }
}
