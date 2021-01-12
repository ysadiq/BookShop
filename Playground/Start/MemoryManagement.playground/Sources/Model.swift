public class Book {
    let title: String
    let author: Author
    public var editor: Editor?

    public init(title: String, author: Author) {
        self.title = title
        self.author = author
    }

    deinit {
        print("Book instance Deinitialized (\(title))!")
    }
}

public class Author {
    let name: String
    public var books: [Book] = []

    public init(name: String) {
        self.name = name
    }

    deinit {
        print("Author instance Deinitialized (\(name))!")
    }
}

public class Editor {
    let name: String
    public var books: [Book] = []

    public init(name: String) {
        self.name = name }

    deinit {
        print("Editor instance Deinitialized (\(name))!")
    }
}
