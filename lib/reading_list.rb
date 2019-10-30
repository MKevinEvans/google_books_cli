class Reading_list

    def list
      @list = Book.all.select{|book| book.on_reading_list == true}
    end

end