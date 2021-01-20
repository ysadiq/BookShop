do {
    let author = Author(name: "Mustafa Mahmoud")
    let book = Book(title: "Dialogue with an atheist",
                    author: author)


    let editor = Editor(name: "M. I. Waley")
    book.editor = editor
    editor.books.append(book)

    author.books.append(book)
}
