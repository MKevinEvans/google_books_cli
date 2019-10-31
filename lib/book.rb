class Book
    attr_accessor :on_reading_list
    attr_reader :book_details

    @@books = []

    def initialize(book_hash:)
        @book_details = book_hash
        @@books.push(self)
        @on_reading_list = false
    end

    def add_to_reading_list
        @on_reading_list = true
    end

    def self.all
        @@books
    end

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

