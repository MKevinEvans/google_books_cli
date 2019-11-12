require 'http_request'

RSpec.describe 'an HTTP request' do

    def http_request(params ={})
        default = { 
            query: Query.new(search_term: "boston molasses disaster")
        }
        HttpRequest.new(default.merge(params))
    end

    def make_test_query
        Query.new(search_term: "dogs")
    end
    let (:test_query) {make_test_query}

# BEHAVIOR IS TESTED THROUGH RESPONSE ADAPTER TESTS!

end