class BookDouble
    attr_reader :title, :authors, :publisher

    def initialize(title, authors, publisher)
        @title = title
        @authors = authors
        @publisher = publisher
    end
end