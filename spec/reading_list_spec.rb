require 'reading_list'
require 'book_spec'


RSpec.describe 'a reading_list' do

    def book
        Book.new(book_hash: {})
    end
    let (:test_book) {book}

    def reading_list
        test_book.add_to_reading_list
        Reading_list.new()
    end

    it 'contains a list with 1 book after a book has been added' do
        test_book.add_to_reading_list
        expect(reading_list.list.length).to_not eq(0)
    end


end
