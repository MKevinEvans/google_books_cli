require 'json'
require 'book'

class Response_adapter
    def initialize(response:)
        @response = response
        convert_to_books
    end

    def response
        @response
    end

    def to_hash
        JSON.parse(@response)
    end

    def items
        to_hash['items']
    end

    def convert_to_books
        items.each do |book|
            book = Book.new(book_hash: book)
        end
    end
end