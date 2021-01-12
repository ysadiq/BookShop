let bookDescription: () -> String
do {
    let author = Author(name: "Mustafa Mahmoud")
    let book = Book(title: "Dialogue with an atheist",
                            author: author)
    bookDescription = book.weakDescription
//    print(book.description)
    let editor = Editor(name: "M. I. Waley")

    author.books.append(book)
    book.editor = editor
    editor.books.append(book)
}
print(bookDescription())
