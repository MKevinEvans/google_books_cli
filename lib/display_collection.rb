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
# THIS OUTPUT IS USED BOTH FOR CASES WHEN THE USERS READING LIST IS EMPTY,
# AS WELL AS IF THE API RETURNS NO RESULTS

            puts
            puts "There are no books in this collection"
            puts
        end
    end
end
