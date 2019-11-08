require 'reading_list'
require 'book_spec'


RSpec.describe 'a reading_list' do

    def book
        Book.new(book_hash: {})
    end
    let (:test_book) {book}

    def make_empty_reading_list
        Reading_list.new
    end
    let (:empty_reading_list) {make_empty_reading_list}

    def make_reading_list_one_book
        list = Reading_list.new
        list.add(test_book)
        list
    end
    let (:reading_list_one_book) {make_reading_list_one_book}

    it 'contains an empty array before a book has been added' do
        expect(empty_reading_list.list.length).to eq(0)
    end

    it 'contains a list with 1 book after a book has been added' do
        expect(reading_list_one_book.list.length).to eq(1)
    end


end
