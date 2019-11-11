require './lib/book'
require './lib/display_collection'
require './lib/http_request'
require './lib/query'
require './lib/reading_list'
require './lib/response_adapter'
require './lib/io'
require './lib/display_helper'

class Session
    attr_accessor :current_collection
    attr_reader :reading_list
    attr_reader :io

    def initialize(io = Io.new, request_handler = HttpRequest)
        @reading_list = ReadingList.new()
        @current_collection = []
        @display_helper = DisplayHelper.new(self, io)
        @request_handler = request_handler
    end

    def start
        @display_helper.start
    end
    
    def search(search_term)
        @display_helper.check_valid_characters(search_term)
        query = Query.new(search_term: search_term)
        @current_collection = @request_handler.new(query: query).request.convert_to_books
        @display_helper.search(@current_collection)
    end

    def route(input)
        @display_helper.check_valid_characters(input)
        reading_list_selector_array = ["1", "2", "3", "4", "5"]

        if(reading_list_selector_array.include?(input))
            @reading_list.append_reading_list(@current_collection[input.to_i-1])
            @display_helper.add_book_to_reading_list(@current_collection[input.to_i-1])
        elsif(input=="reading list")
            @display_helper.reading_list(@reading_list)
        elsif(input=="exit")
            @display_helper.exit
        else
            search(input)
        end
    end

end