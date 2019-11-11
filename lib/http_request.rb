require 'net/http'

class HttpRequest
    attr_reader :query

    def initialize(query:)
        @query = query
    end

    def base_url
        "https://www.googleapis.com/books/v1/volumes?q="
    end

    def final_url
        base_url+query.search_term
    end

# This method makes the request and calls the adapter which results in the response becoming books.
# Notes: It has no direct output
    def request
        uri = URI(final_url)
        response = Net::HTTP.get(uri)
        ResponseAdapter.new(response: response)
    end
end