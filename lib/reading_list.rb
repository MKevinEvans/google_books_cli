class Reading_list
  attr_accessor :list

    def initialize
      @list = []
    end

    def add(book)
      unless(@list.include?(book))
        @list.push(book)
      end
    end

    def append_reading_list(number, session)
      index = number.to_i-1
      add(session.current_collection[index])

      puts
      print session.current_collection[index].title, " has been added to your reading list." "\n"
      print "Enter 1-5 to add another book to your reading list, enter a new search term to view more books, or enter 'reading list' to view your reading list: "
      session.route(gets.strip)
  end
end