public class Book {
    let title: String
    unowned let author: Author
    public weak var editor: Editor?
    public lazy var weakDescription: () -> String = { [weak self, title] in
        print(title)
        guard let self = self else {
            return "Error: Book is deinitialized (\(title))!"
        }
        return "\(self.title) by \(self.author.name)"
    }

    public lazy var description: () -> String = {
        return "\(self.title) by \(self.author.name)"
    }

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
        self.name = name
    }

    deinit {
        print("Editor instance Deinitialized (\(name))!")
    }
}
