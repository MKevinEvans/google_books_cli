require './lib/display_collection'

class DisplayHelper

    def initialize(session, io)
        @session = session
        @io  = io
    end

    def start
        @io.produce_output "Hello! Enter a search term to find books: "
        search_term = @io.receive_input.strip
        @session.search(search_term)
    end

    def search(collection)
        display_collection(collection)
        @io.produce_output "\n"
        @io.produce_output "Enter 1-5 to add one of these books to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: "
        @session.route(@io.receive_input.strip)
    end

    def add_book_to_reading_list(book)
        @io.produce_output "\n"
        @io.produce_output book.title, " has been added to your reading list." "\n"
        @io.produce_output "Enter 1-5 to add another book to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: "
        @session.route(@io.receive_input.strip)
    end

    def reading_list(reading_list)
        display_collection(reading_list.list)
        @io.produce_output "Enter a new search term to view more books: "
        @session.search(@io.receive_input.strip)
    end

    def exit
        @io.produce_output "Goodbye \n"
    end

# Checks to ensure all characters are those that have been tested with the API and doesn't exceed max length
    def check_valid_characters(input)
        unless(input.match? /\A[a-z A-Z0-9!@#&*()-+=\/~;:?'-]{1,40}\z/)
            @io.produce_output "invalid search, please try another: "
            @session.search(@io.receive_input.strip)
        end
    end

    def display_collection(collection)
        DisplayCollection.new(collection: collection, io: @io).display
    end
end