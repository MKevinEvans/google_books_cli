require 'http_request'

RSpec.describe 'an HTTP request' do

    def http_request(params ={})
        default = { 
            query: Query.new(search_term: "boston molasses disaster")
        }
        Http_request.new(default.merge(params))
    end

    it 'accepts a query' do
        expect(http_request(query: Query.new(search_term: "dogs")).query).to be_an_instance_of(Query)
    end

    it 'has a default query if none is provided (for testing only)' do
        expect(http_request().query).to be_an_instance_of(Query)
    end

    it 'contains a base url' do
        expect(http_request().base_url).to be_an_instance_of(String)
    end

    it 'combines the base url with the search term' do
        expect(http_request().final_url).to eq("https://www.googleapis.com/books/v1/volumes?q=boston molasses disaster")
    end

end