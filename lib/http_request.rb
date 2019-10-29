require 'net/http'
require 'json'

class Http_request

    def initialize(query:)
        @query = query
    end

    def query
        @query
    end

    def base_url
        "https://www.googleapis.com/books/v1/volumes?q="
    end

    def final_url
        base_url+query.search_term
    end

    def request
        uri = URI(final_url)
        Net::HTTP.get(uri)
    end

end