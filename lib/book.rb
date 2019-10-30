class Book
    @@books = []

    def initialize(book_hash:)
        @book_details = book_hash
        @@books.push(self)
    end

    def convert_json(hash)
        hash.keys.each do |key|
            this[key] = value
        end
    end

    def book_details
        @book_details
    end

    def self.all
        @@books
    end
end