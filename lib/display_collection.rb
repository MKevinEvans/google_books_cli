class DisplayCollection

    def initialize(collection:, io:)
        @books = collection
        @io = io
    end

    def display
        if(@books.length > 0)
            @books.each_with_index do |book, i|
                @io.produce_output "\n"
                @io.produce_output i+1, ") Title: ", book.title, "\n"
                @io.produce_output "Author(s): ", book.authors.join(", "), "\n"
                @io.produce_output "Publisher: ", book.publisher, "\n"
                @io.produce_output "\n"
            end
        else
# THIS OUTPUT IS USED BOTH FOR CASES WHEN THE USERS READING LIST IS EMPTY,
# AS WELL AS IF THE API RETURNS NO RESULTS

            @io.produce_output "\n"
            @io.produce_output "There are no books in this collection"
            @io.produce_output "\n"
        end
    end
end
