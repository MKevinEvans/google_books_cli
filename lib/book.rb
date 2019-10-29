class Book
    @@books = []

    def initialize(book_json:)
        @book_details = book_json
        @@books.push(self)
    end

    def all
        @@books
    end
end