require 'json'
require './lib/book'

# This  adapter takes the response from an HTTP request and turns the first 5 results given into book objects
# Note: this is called in the Http_request 'request' method
class Response_adapter
    attr_reader :response

    def initialize(response:)
        @response = response
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