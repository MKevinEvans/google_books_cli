require 'book'
require 'http_request'
require 'query'

RSpec.describe 'a book' do

    def book
        Response_adapter.new(response: Http_request.new(query: Query.new(search_term: "boston molasses disaster")).request).convert_to_books
        Book.all.first
    end

    it 'converts the json data into key value pairs' do
        expect(book.volume_info).to exist
    end
end