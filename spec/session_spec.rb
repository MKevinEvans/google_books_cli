require 'session'
require './mocks/io_test_double'
require './mocks/http_request_double'


RSpec.describe 'a session' do


    
    
    it 'creates a new collection of books' do
        mock_io = IoTestDouble.new(["2\n", "exit\n"])
        session = Session.new(mock_io, HttpRequestDouble)
        session.search("boston molases disaster")
        expect(session.current_collection[0].title).to eq("Dark Tide")
    end


    it 'adds a book to the reading list when a user selects a book' do
        mock_io = IoTestDouble.new(["2\n", "exit\n"])
        session = Session.new(mock_io, HttpRequestDouble)
        session.search("boston molases disaster")
        expect(session.reading_list.list[0].title).to eq("Dark Tide")
    end
end
