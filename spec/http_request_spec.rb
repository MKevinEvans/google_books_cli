require 'http_request'

RSpec.describe 'an HTTP request' do

    def http_request(params ={})
        default = { 
            query: Query.new(search_term: "boston molasses disaster")
    }
    Http_request.new(default.merge(params))
    end

    it 'accepts a query' do
        raise unless http_request(query: Query.new(search_term: "ducks")).query.search_term == "ducks"
    end

    it 'has a default query if none is provided (in testing only)' do
        raise unless http_request().query.search_term == "boston molasses disaster"
    end

end