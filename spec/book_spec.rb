require 'book'

RSpec.describe 'a book' do

    def book
        Book.new(book_hash: book_hash)
    end

    def other
        Book.new(book_hash: other_book_hash)
    end

    let (:test_book) {book}
    let (:test_other) {other}

    it 'makes book details retrievable through key value pairs' do
        expect(test_book['volumeInfo']).not_to eq(nil)
    end

    it 'has a title when title is present' do
        expect(test_book.title).to be_instance_of(String)
    end

    it 'lists "untitled" when no title is listed' do
        expect(test_other.title).to eq("untitled")
    end

    it 'lists 1 author when only 1 author is present' do
        expect(test_book.authors[0]).to eq("Stephen Puleo")
    end

    it 'lists all authors when more than 1 authors are present' do
        expect(other_test_book.authors).to be_instance_of(Array)
    end

    it 'lists "no author" when no author is listed' do
        expect(test_other.authors[0]).to eq("no author")
    end

    it 'has a publisher when publisher is present' do
        expect(test_book.publisher).to be_instance_of(String)
    end

    it 'displays "no publisher" when no publisher is listed' do
        expect(test_other.publisher).to eq("no publisher")
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

    def other_book_hash
                {"kind"=>"books#volume",
        "id"=>"K7xVDwAAQBAJ",
        "etag"=>"m5Oyh95wnSc",
        "selfLink"=>"https://www.googleapis.com/books/v1/volumes/K7xVDwAAQBAJ",
        "volumeInfo"=>
        {"title"=>nil,
        "subtitle"=>"The Great Boston Molasses Flood of 1919",
        "authors"=>nil,
        "publisher"=>nil,
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