require 'response_adapter'
require './mocks/http_request_double'

RSpec.describe 'a response adapter' do



    def http_request_double
        HttpRequestDouble.new("filler argument")
    end

    it 'turns the first 5 book items into book objects' do
        expect(http_request_double.request.convert_to_books[0].title).to eq("Dark Tide")
    end

end
