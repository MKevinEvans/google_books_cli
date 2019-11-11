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

# Implementation not behavior?
    # it 'accepts a query' do
    #     expect(http_request(query: test_query).query.search_term).to eq("dogs")
    # end

# # Implementation not behavior
#     it 'has a default query if none is provided (for testing only)' do
#         expect(http_request().query.search_term).to eq("boston molasses disaster")
#     end

# # Implementation not behavior
    # it 'contains google books api\'s base url' do
    #     expect(http_request().base_url).to eq("https://www.googleapis.com/books/v1/volumes?q=")
    # end

    # it 'combines the base url with the search term' do
    #     expect(http_request().final_url).to eq("https://www.googleapis.com/books/v1/volumes?q=boston molasses disaster")
    # end

end