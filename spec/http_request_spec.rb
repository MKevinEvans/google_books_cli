require 'http_request'

RSpec.describe 'an HTTP request' do

    def http_request(params ={})
        default = { 
            query: Query.new(search_term: "boston molasses disaster")
        }
        Http_request.new(default.merge(params))
    end

    def make_test_query
        Query.new(search_term: "dogs")
    end
    let (:test_query) {make_test_query}

    it 'accepts a query' do
        expect("dogs").to eq(http_request(query: test_query).query.search_term)
    end

    it 'has a default query if none is provided (for testing only)' do
        expect("boston molasses disaster").to eq(http_request().query.search_term)
    end

    it 'contains google books api\'s base url' do
        expect("https://www.googleapis.com/books/v1/volumes?q=").to eq(http_request().base_url)
    end

    it 'combines the base url with the search term' do
        expect("https://www.googleapis.com/books/v1/volumes?q=boston molasses disaster").to eq(http_request().final_url)
    end

end