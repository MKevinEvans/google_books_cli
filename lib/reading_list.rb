class Reading_list

    def initialize
        @list = []
    end

    def list
      @list = Book.all.select{|book| book.on_reading_list == true}
    end
end