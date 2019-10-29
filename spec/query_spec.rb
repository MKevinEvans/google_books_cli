require 'query'

RSpec.describe 'a search query' do

    def query(params ={})
        default = { 
            search_term: "boston molasses disaster"
    }
        Query.new(default.merge(params))
    end

    it 'accepts a search term' do
        raise unless query(search_term: "dogs").search_term == "dogs"
    end

    it 'has a default search term if none is provided (in testing only)' do
        raise unless query().search_term == "boston molasses disaster"
    end
end