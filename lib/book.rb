class Book
    @@books = []

    def initialize(book_hash:)
        @book_details = book_hash
        @@books.push(self)
    end

    def book_details
        @book_details
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
    
    def []=(key,val)
        @book_details[key]=val
    end

    def set_prop(key, value)
      @book_details[key] = value
    end

end