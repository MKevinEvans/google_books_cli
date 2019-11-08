require './lib/book'
require './lib/display_collection'
require './lib/http_request'
require './lib/query'
require './lib/reading_list'
require './lib/response_adapter'

class Session
    attr_accessor :current_collection

    def initialize
        @reading_list = Reading_list.new()
        @current_collection = []
    end
    
    def search(search_term)
        check_valid_characters(search_term)
        @current_collection = Http_request.new(query: Query.new(search_term: search_term)).request.convert_to_books
        # Selects the last 5 books created, which will always be the result of the most recent search
        Display_collection.new(collection: Book.all[Book.all.length-5..Book.all.length-1]).display
        #
        
        puts
        print "Enter 1-5 to add one of these books to your reading list, enter a new search term to view more books, or enter 'reading list' to view your reading list: "
        route(gets.strip)
    end

    def route(input)
        check_valid_characters(input)
        reading_list_selector_array = ["1", "2", "3", "4", "5"]

        if(reading_list_selector_array.include?(input))
            @reading_list.append_reading_list(input, self)
        elsif(input=="reading list")
            Display_collection.new(collection: @reading_list.list).display
            print "Enter a new search term to view more books: "
            search(gets.strip)
        else
            search(input)
        end
    end

# Checks to ensure all characters are those that have been tested with the API and doesn't exceed max length
    def check_valid_characters(input)
        unless(input.match? /\A[a-z A-Z0-9!@#&*()-+=\/~;:?'-]{1,40}\z/)
            print "invalid search, please try another: "
            route(gets.strip)
        end
    end

end