//
//  Book.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import Foundation

struct GoogleBooks: Codable {
    static var builtins: [GoogleBook] = [Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("The Myth of Normal"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=beE2EAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("In the Realm of Hungry Ghosts"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=EivUaonC2TcC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("When the Body Says No"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8hjoyCFTu6IC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("Scattered Minds"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_FoNmxfSPAUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("Scattered"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=N-LOzAUy1E0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("Hold On to Your Kids"), authors: Optional(["Gordon Neufeld", "Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=2Qr98PzAKTkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("Scattered Minds"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=Nv2hEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("When the Body Says No"), authors: Optional(["Gabor Mate"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=BBWorCaG_zUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("The Scourge of the Swastika"), authors: Optional(["Edward Frederick Langley Russell Baron Russell of Liverpool"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=qeKbPwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")))), Xcerpt.GoogleBooks.GoogleBook(volumeInfo: Xcerpt.Book(title: Optional("Psychedelics and Psychotherapy"), authors: Optional(["Tim Read", "Maria Papaspyrou"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=VZgfEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"))))]
    
    let items: [GoogleBook]
    
    struct GoogleBook: Codable, Identifiable {
        var id = UUID()
        let volumeInfo: Book
        
        enum CodingKeys: CodingKey {
            case volumeInfo
        }
    }
}

struct Book: Codable, Identifiable, Hashable {
    static var builtins: [Book] = [Xcerpt.Book(title: Optional("The Myth of Normal"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=beE2EAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: Optional("In the Realm of Hungry Ghosts"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=EivUaonC2TcC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: Optional("When the Body Says No"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=8hjoyCFTu6IC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: Optional("Scattered Minds"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_FoNmxfSPAUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: Optional("Scattered"), authors: Optional(["Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=N-LOzAUy1E0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins), Xcerpt.Book(title: Optional("Hold On to Your Kids"), authors: Optional(["Gordon Neufeld", "Gabor Maté, MD"]), imageLinks: Optional(Xcerpt.Book.ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=2Qr98PzAKTkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")), excerpts: Excerpt.builtins)]
    
    var id = UUID()
    let title: String?
    let authors: [String]?
    let imageLinks: ImageLinks?
    struct ImageLinks: Codable, Hashable {
        let smallThumbnail: String
    }
    var excerpts: [Excerpt] = []
    
    enum CodingKeys: CodingKey {
        case title, authors, imageLinks
    }
}


