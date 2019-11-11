require './lib/book'
require './lib/display_collection'
require './lib/http_request'
require './lib/query'
require './lib/reading_list'
require './lib/response_adapter'
require './lib/io'

class Session
    attr_accessor :current_collection
    attr_reader :reading_list
    attr_reader :io

    def initialize(io = Io.new, request_handler = HttpRequest)
        @reading_list = ReadingList.new()
        @current_collection = []
        @io = io
        @request_handler = request_handler
    end
    
    def search(search_term)
        check_valid_characters(search_term)
        query = Query.new(search_term: search_term)
        @current_collection = @request_handler.new(query: query).request.convert_to_books
        DisplayCollection.new(collection: @current_collection, session: self).display
        @io.produce_output "\n"
        @io.produce_output "Enter 1-5 to add one of these books to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: "
        route(@io.receive_input.strip)
    end

    def route(input)
        check_valid_characters(input)
        reading_list_selector_array = ["1", "2", "3", "4", "5"]

        if(reading_list_selector_array.include?(input))
            @reading_list.append_reading_list(@current_collection[input.to_i-1])
            @io.produce_output "\n"
            @io.produce_output @current_collection[input.to_i-1].title, " has been added to your reading list." "\n"
            @io.produce_output "Enter 1-5 to add another book to your reading list, enter a new search term to view more books, enter 'reading list' to view your reading list, or enter 'exit' to quit: "
            route(@io.receive_input.strip)
        elsif(input=="reading list")
            DisplayCollection.new(collection: @reading_list.list, session: self).display
            @io.produce_output "Enter a new search term to view more books: "
            search(@io.receive_input.strip)
        elsif(input=="exit")
            @io.produce_output "Goodbye \n"
        else
            search(input)
        end
    end

# Checks to ensure all characters are those that have been tested with the API and doesn't exceed max length
    def check_valid_characters(input)
        unless(input.match? /\A[a-z A-Z0-9!@#&*()-+=\/~;:?'-]{1,40}\z/)
            @io.produce_output "invalid search, please try another: "
            search(@io.receive_input.strip)
        end
    end

end