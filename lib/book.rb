class Book
    attr_accessor :book_details

    def initialize(book_hash:)
        @book_details = book_hash
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

    def ==(other)
        if other.nil? || !other.instance_of?(Book)
            false
        else
            title == other.title && authors == other.authors && publisher == other.publisher
        end
    end

end

