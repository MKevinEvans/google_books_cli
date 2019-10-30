require 'reading_list'
require 'book_spec'


RSpec.describe 'a reading_list' do

    def book
        Book.new(book_hash: {})
    end
    let (:test_book) {book}

    def empty_reading_list
        Reading_list.new()
    end

    def reading_list
        test_book.add_to_reading_list
        Reading_list.new()
    end

    it 'contains an empty array before a book has been added' do
        expect(empty_reading_list.list.length).to eq(0)
    end

    it 'contains a list with 1 book after a book has been added' do
        test_book.add_to_reading_list
        expect(reading_list.list.length).to eq(1)
    end


end
