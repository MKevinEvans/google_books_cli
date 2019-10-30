require 'response_adapter'

RSpec.describe 'a response adapter' do

    def response_adapter(params ={})
        default = { 
            response: Http_request.new(query: Query.new(search_term: "boston molasses disaster")).request
        }
        Response_adapter.new(default.merge(params))
    end

    it 'receives a response of type String' do
        expect(response_adapter.response).to be_an_instance_of(String)
    end

    it 'converts the response to a hash' do
        expect(response_adapter.to_hash).to be_an_instance_of(Hash)
    end

    it 'parses out an array book responses from the response' do
        expect(response_adapter.items).to  be_an_instance_of(Array)
    end

    it 'turns each item into a book object' do
        expect(Book.all.length).to eq(response_adapter.items.length)
    end

end
