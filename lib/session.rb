require './lib/book'
require './lib/display_collection'
require './lib/http_request'
require './lib/query'
require './lib/reading_list'
require './lib/response_adapter'

class Session

    def search(search_term)
        Http_request.new(query: Query.new(search_term: search_term)).request
        Display_collection.new(collection: Book.all[Book.all.length-5..Book.all.length-1]).display
        puts
        print "Enter 1-5 to add one of these books to your reading list, enter a new search term to view more books, or enter 'reading list' to view your reading list: "
        route(gets.strip)
    end

    def append_reading_list(number)
        index = number.to_i-1
        current_collection = current_collection = Book.all.select.with_index{|book, index| index >= (Book.all.length-5)}
        current_collection[index].add_to_reading_list
        puts
        print current_collection[index].title, " has been added to your reading list. Enter 1-5 to add another book to your reading list, enter a new search term to view more books, or enter 'reading list' to view your reading list: "
        route(gets.strip)
    end

    def route(input)
        reading_list_selector_array = ["1", "2", "3", "4", "5"]
        if(reading_list_selector_array.include?(input))
            append_reading_list(input)
        elsif(input=="reading list")
            Display_collection.new(collection: Reading_list.new.list).display
            print "Enter a new search term to view more books: "
            search(gets.strip)
        else
            search(input)
        end
    end

end