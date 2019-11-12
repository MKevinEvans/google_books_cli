require 'query'

RSpec.describe 'a search query' do

    def query(params ={})
        default = { 
            search_term: "boston molasses disaster"
    }
        Query.new(default.merge(params))
    end


end