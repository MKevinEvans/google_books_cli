class Reading_list

# Every reading_list sources all of the books that have had add_to_reading_list set to true
    def list
      @list = Book.all.select{|book| book.on_reading_list == true}
    end

end