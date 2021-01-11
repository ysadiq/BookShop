//
//  ViewModel.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/11/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

import UIKit

class ViewModel {
    var allBooks: [Book] = []
    var state: State = .empty {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    var updateLoadingStatus: (()->())?

    func fetchBooks() {
        state = .loading

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
            for _ in 0..<6 {
                var author = Author(name: "Mustafa Mahmoud")
                let book = Book(title: "Dialogue with an atheist",
                                thumbnail: UIImage(named: "DWAA"),
                                author: author,
                                description: "Who created the Creator, that God you talk about?’ ‘If God preordained my deeds, why should He judge me?’ ‘Why did God create Evil?")

                author.books.append(book)
                self.allBooks.append(book)
            }

            self.state = .populated
        }
    }
}

public enum State {
    case loading
    case empty
    case populated
}
