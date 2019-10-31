require 'query'

RSpec.describe 'a search query' do

    def query(params ={})
        default = { 
            search_term: "boston molasses disaster"
    }
        Query.new(default.merge(params))
    end

    it 'accepts a search term' do
        expect(query(search_term: "dogs").search_term).to eq("dogs")
    end

    it 'has a default search term if none is provided (for testing only)' do
        expect(query().search_term).to eq("boston molasses disaster")
    end
end