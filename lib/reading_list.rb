class Reading_list

# Every reading_list sources all of the books that have had add_to_reading_list set to true
    def list
      @list = Book.all.select{|book| book.on_reading_list == true}
    end

    def append_reading_list(number, session)
      index = number.to_i-1
      current_collection = Book.all.select.with_index{|book, index| index >= (Book.all.length-5)}
      current_collection[index].add_to_reading_list

      puts
      print current_collection[index].title, " has been added to your reading list." "\n"
      print "Enter 1-5 to add another book to your reading list, enter a new search term to view more books, or enter 'reading list' to view your reading list: "
      session.route(gets.strip)
  end
end