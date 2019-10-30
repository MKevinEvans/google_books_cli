require 'response_adapter'

RSpec.describe 'a response adapter' do


    let (:response_adapter) {Http_request.new(query: Query.new(search_term: "boston molasses disaster")).request}

    it 'receives a response of type String' do
        expect(response_adapter.response).to be_an_instance_of(String)
    end

    it 'converts the response to a hash' do
        expect(response_adapter.to_hash).to be_an_instance_of(Hash)
    end

    it 'parses out an array book responses from the response' do
        expect(response_adapter.items).to  be_an_instance_of(Array)
    end

    it 'turns the first 5 book items into book objects' do
        expect(Book.all.last['volumeInfo']['title']).to eq(response_adapter.items[response_adapter.items.length-6]['volumeInfo']['title'])
    end

end
