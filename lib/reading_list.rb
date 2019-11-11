class ReadingList
  attr_accessor :list

    def initialize
      @list = []
    end

    def add(book)
      unless(@list.include?(book))
        @list.push(book)
      end
    end

    def append_reading_list(book)
      add(book)
  end
end