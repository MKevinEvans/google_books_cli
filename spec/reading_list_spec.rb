require 'reading_list'


RSpec.describe 'a reading_list' do

    def book
        Book.new(book_hash: book_hash)
    end
    let (:test_book) {book}
    
    def duplicate_book
        Book.new(book_hash: book_hash)
    end
    let (:duplicate_test_book) {duplicate_book}

    def make_empty_reading_list
        ReadingList.new
    end
    let (:empty_reading_list) {make_empty_reading_list}

    def make_reading_list_one_book
        list = ReadingList.new
        list.add(test_book)
        list
    end
    let (:reading_list_one_book) {make_reading_list_one_book}

    it 'contains an empty array before a book has been added' do
        expect(empty_reading_list.list[0]).to eq(nil)
    end

    it 'contains a list with 1 book after a book has been added' do
        expect(reading_list_one_book.list[0]).to eq(test_book)
    end

    it 'contains only 1 of each books added' do
        reading_list_one_book.add(duplicate_test_book)
        expect(reading_list_one_book.list.length).to eq(1)
    end

    def book_hash
        {"kind"=>"books#volume",
        "id"=>"K7xVDwAAQBAJ",
        "etag"=>"m5Oyh95wnSc",
        "selfLink"=>"https://www.googleapis.com/books/v1/volumes/K7xVDwAAQBAJ",
        "volumeInfo"=>
        {"title"=>"Dark Tide",
        "subtitle"=>"The Great Boston Molasses Flood of 1919",
        "authors"=>["Stephen Puleo"],
        "publisher"=>"Beacon Press",
        "publishedDate"=>"2019-01-15",
        "description"=>
            "A new 100th anniversary edition of the only adult book on one of the odder disasters in US history—and the greed, disregard for poor immigrants, and lack of safety standards that led to it. Around noon on January 15, 1919, a group of firefighters were playing cards in Boston’s North End when they heard a tremendous crash. It was like roaring surf, one of them said later. Like a runaway two-horse team smashing through a fence, said another. A third firefighter jumped up from his chair to look out a window—“Oh my God!” he shouted to the other men, “Run!” A 50-foot-tall steel tank filled with 2.3 million gallons of molasses had just collapsed on Boston’s waterfront, disgorging its contents as a 15-foot-high wave of molasses that at its outset traveled at 35 miles an hour. It demolished wooden homes, even the brick fire station. The number of dead wasn’t known for days. It would be years before a landmark court battle determined who was responsible for the disaster.",
        "industryIdentifiers"=>
            [{"type"=>"ISBN_13", "identifier"=>"9780807078013"}, {"type"=>"ISBN_10", "identifier"=>"0807078018"}],
        "readingModes"=>{"text"=>true, "image"=>false},
        "pageCount"=>280,
        "printType"=>"BOOK",
        "categories"=>["History"],
        "averageRating"=>4.0,
        "ratingsCount"=>17,
        "maturityRating"=>"NOT_MATURE",
        "allowAnonLogging"=>false,
        "contentVersion"=>"1.1.1.0.preview.2",
        "panelizationSummary"=>{"containsEpubBubbles"=>false, "containsImageBubbles"=>false},
        "imageLinks"=>
            {"smallThumbnail"=>
            "http://books.google.com/books/content?id=K7xVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
            "thumbnail"=>
            "http://books.google.com/books/content?id=K7xVDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"},
        "language"=>"en",
        "previewLink"=>
            "http://books.google.com/books?id=K7xVDwAAQBAJ&printsec=frontcover&dq=boston+molasses+disaster&hl=&cd=1&source=gbs_api",
        "infoLink"=>
            "http://books.google.com/books?id=K7xVDwAAQBAJ&dq=boston+molasses+disaster&hl=&source=gbs_api",
        "canonicalVolumeLink"=>"https://books.google.com/books/about/Dark_Tide.html?hl=&id=K7xVDwAAQBAJ"},
        "saleInfo"=>{"country"=>"US", "saleability"=>"NOT_FOR_SALE", "isEbook"=>false},
        "accessInfo"=>
        {"country"=>"US",
        "viewability"=>"PARTIAL",
        "embeddable"=>true,
        "publicDomain"=>false,
        "textToSpeechPermission"=>"ALLOWED",
        "epub"=>
            {"isAvailable"=>true,
            "acsTokenLink"=>
            "http://books.google.com/books/download/Dark_Tide-sample-epub.acsm?id=K7xVDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"},
        "pdf"=>{"isAvailable"=>false},
        "webReaderLink"=>
            "http://play.google.com/books/reader?id=K7xVDwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
        "accessViewStatus"=>"SAMPLE",
        "quoteSharingAllowed"=>false},
        "searchInfo"=>
        {"textSnippet"=>
            "A new 100th anniversary edition of the only adult book on one of the odder disasters in US history—and the greed, disregard for poor immigrants, and lack of safety standards that led to it."}}
    end


end
