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
            for _ in 0..<Int.numberOfShimmeringCells {
                let author = Author(name: "Mustafa Mahmoud")
                let book = Book(title: "Dialogue with an atheist",
                                thumbnail: UIImage(named: "DWAA"),
                                author: author,
                                description: "Series of imaginary conversations to guide the believer in their task of helping those seemingly deprived of faith in God, His Message, and His Messenger.")

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
