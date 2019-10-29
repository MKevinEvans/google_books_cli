require 'json'
require 'book'

class Response_adapter
    def initialize(response:)
        @response = response
    end

    def response
        @response
    end

    def json
        JSON.parse(@response)
    end

    def items
        json['items']
    end

    def convert_to_books
        items.each do |book|
            Book.new(book_json: book)
        end
    end
end