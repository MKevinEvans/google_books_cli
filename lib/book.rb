class Book
    attr_reader :book_details

    @@books = []

    def initialize(book_hash:)
        @book_details = book_hash
        @@books.push(self)
    end

    def self.all
        @@books
    end

# Nonstandard getter methods to accomodate the information being in the volumeInfo field returned from the API
# The second part of the expression returns default display information for when the information was not listed
    def title
        @book_details['volumeInfo']['title'] ||= "untitled"
    end

    def authors
        @book_details['volumeInfo']['authors'] ||= ['no author']
    end

    def publisher
        @book_details['volumeInfo']['publisher'] ||= "no publisher"
    end
  
    def [](key)
      @book_details[key]
    end

    def []=(key,val)
      @book_details[key]=val
    end

end

