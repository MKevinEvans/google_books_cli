require 'json'
require './lib/book'

class Response_adapter
    attr_reader :response

    def initialize(response:)
        @response = response
        convert_to_books
    end

    def to_hash
        JSON.parse(@response)
    end

    def items
        to_hash['items']
    end

    def convert_to_books
        items[0..4].map do |book|
            book = Book.new(book_hash: book)
        end
    end
end