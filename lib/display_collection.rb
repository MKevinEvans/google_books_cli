class Display_collection

    def initialize(collection:)
        @books = collection
    end

    def display
        if(@books.length > 0)
            @books.each_with_index do |book, i|
                puts
                print i+1, ") Title: ", book.title, "\n"
                print "Author(s): ", book.authors.join(", "), "\n"
                print "Publisher: ", book.publisher, "\n"
                puts
            end
        else
            puts
            puts "There are no books in this collection"
            puts
        end
    end
end
