require 'session'
require './mocks/io_test_double'
require './mocks/http_request_double'
require './mocks/book_double'

RSpec.describe 'a session' do

    describe 'a search' do

        it 'creates a new collection of books' do
            mock_io = IoTestDouble.new(["2\n", "exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            session.search("boston molasses disaster")
            expect(session.current_collection[0].title).to eq("Dark Tide")
        end
    end

    describe 'a route' do

        it 'adds a book to the reading list when a user selects a book' do
            mock_io = IoTestDouble.new(["2\n", "exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            session.search("boston molasses disaster")
            expect(session.reading_list.list[0].title).to eq("Dark Tide")
        end
        
        it 'outputs add to reading list confirmation when a book is selected' do
            mock_io = IoTestDouble.new(["exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            session.current_collection.push(BookDouble.new("book1", ["Stephen Puleo"], "Beacon Press (MA)"))
            session.current_collection.push(BookDouble.new("Dark Tide", ["Stephen Puleo"], "Beacon Press (MA)"))
            session.current_collection.push(BookDouble.new("book3", ["Stephen Puleo"], "Beacon Press (MA)"))
            session.current_collection.push(BookDouble.new("book4", ["Stephen Puleo"], "Beacon Press (MA)"))
            session.current_collection.push(BookDouble.new("book5", ["Stephen Puleo"], "Beacon Press (MA)"))

            expect {session.route("2")}.to output(reading_list_add_confirmation).to_stdout
        end

        it 'outputs search results when called with a search term"' do
            mock_io = IoTestDouble.new(["exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            expect{session.route("boston molasses disaster")}.to output(search_output).to_stdout
        end

        it 'outputs empty reading list when reading list is empty' do
            mock_io = IoTestDouble.new(["exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            expect{session.route("reading list")}.to output(empty_reading_list_output).to_stdout
        end

        it 'outputs reading list when reading list is not empty' do
            mock_io = IoTestDouble.new(["exit\n"])
            session = Session.new(mock_io, HttpRequestDouble)
            book = BookDouble.new("Dark Tide", ["Stephen Puleo"], "Beacon Press (MA)")
            session.reading_list.add(book)
            expect{session.route("reading list")}.to output(reading_list_output).to_stdout
        end
    end

    def empty_reading_list_output
        "\nThere are no books in this collection\nEnter a new search term to view more books: Goodbye \n"
    end

    def reading_list_output
        "\n1) Title: Dark Tide\nAuthor(s): Stephen Puleo\nPublisher: Beacon Press (MA)\n\nEnter a new search term to view more books: Goodbye \n"
    end

    def reading_list_add_confirmation
        "\nDark Tide has been added to your reading list.\nEnter 1-5 to add another book to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: Goodbye \n"
    end

    def search_output
        "\n1) Title: Dark Tide\nAuthor(s): Stephen Puleo\nPublisher: Beacon Press\n\n\n2) Title: Dark Tide\nAuthor(s): Stephen Puleo\nPublisher: Beacon Press (MA)\n\n\n3) Title: I Survived The Great Molasses Flood, 1919 (I Survived #19)\nAuthor(s): Lauren Tarshis\nPublisher: Scholastic Inc.\n\n\n4) Title: I Survived True Stories\nAuthor(s): Lauren Tarshis\nPublisher: Scholastic\n\n\n5) Title: The Great Molasses Flood\nAuthor(s): Beth Wagner Brust\nPublisher: Troll Communications Llc\n\n\nEnter 1-5 to add one of these books to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: Goodbye \n"
    end

end
