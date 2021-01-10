//
//  Editor.swift
//  BookShop
//
//  Created by Yahya Saddiq on 1/10/21.
//  Copyright © 2021 Yahya Saddiq. All rights reserved.
//

class Editor {
    let name: String
    var books: [Book] = []

    init(name: String) {
        self.name = name }

    deinit {
        print("Goodbye editor \(name)!")
    }
}
