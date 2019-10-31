class Query
    attr_reader :search_term

    def initialize(search_term:)
        @search_term = search_term
    end
end

